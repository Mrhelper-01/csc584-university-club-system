// ===== MODERN INTERACTIONS =====

document.addEventListener('DOMContentLoaded', function() {
    
    // 1. Add icons to all buttons
    addIconsToButtons();
    
    // 2. Add hover effects to table rows
    enhanceTables();
    
    // 3. Form validation animations
    setupFormAnimations();
    
    // 4. KPI counter animation
    animateKPIs();
    
    // 5. Parallax effect on scroll
    setupParallax();
    
    // 6. Tooltips
    setupTooltips();
});

function addIconsToButtons() {
    const buttons = document.querySelectorAll('.button, .action-link, nav a');
    
    buttons.forEach(button => {
        if (button.href && !button.querySelector('.icon')) {
            const icon = document.createElement('span');
            icon.className = 'icon';
            
            if (button.href.includes('login')) icon.textContent = '🔑';
            else if (button.href.includes('register')) icon.textContent = '📝';
            else if (button.href.includes('dashboard')) icon.textContent = '📊';
            else if (button.href.includes('create')) icon.textContent = '➕';
            else if (button.href.includes('edit')) icon.textContent = '✏️';
            else if (button.href.includes('delete')) icon.textContent = '🗑️';
            else if (button.href.includes('logout')) icon.textContent = '🚪';
            else icon.textContent = '➡️';
            
            button.insertBefore(icon, button.firstChild);
        }
    });
}

function enhanceTables() {
    const tableRows = document.querySelectorAll('tr');
    
    tableRows.forEach(row => {
        row.addEventListener('mouseenter', function() {
            this.style.transition = 'all 0.3s ease';
        });
        
        // Add click animation
        row.addEventListener('click', function(e) {
            if (!e.target.closest('a')) {
                this.style.backgroundColor = '#f8f9fa';
                setTimeout(() => {
                    this.style.backgroundColor = '';
                }, 300);
            }
        });
    });
}

function setupFormAnimations() {
    const formInputs = document.querySelectorAll('input, select, textarea');
    
    formInputs.forEach(input => {
        // Add focus animation
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'scale(1.02)';
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'scale(1)';
        });
        
        // Add validation feedback
        input.addEventListener('input', function() {
            if (this.value.trim() !== '') {
                this.style.borderColor = '#2ecc71';
                this.style.boxShadow = '0 0 0 3px rgba(46, 204, 113, 0.2)';
            } else {
                this.style.borderColor = '#ddd';
                this.style.boxShadow = 'none';
            }
        });
    });
}

function animateKPIs() {
    const kpiValues = document.querySelectorAll('.kpi-value');
    
    kpiValues.forEach(kpi => {
        const finalValue = kpi.textContent;
        kpi.textContent = '0';
        
        let counter = 0;
        const interval = setInterval(() => {
            counter++;
            kpi.textContent = counter;
            
            if (counter >= parseInt(finalValue)) {
                clearInterval(interval);
                kpi.textContent = finalValue;
            }
        }, 50);
    });
}

function setupParallax() {
    window.addEventListener('scroll', function() {
        const scrolled = window.pageYOffset;
        const parallaxElements = document.querySelectorAll('header, .kpi-box');
        
        parallaxElements.forEach(el => {
            const speed = 0.5;
            el.style.transform = `translateY(${scrolled * speed}px)`;
        });
    });
}

function setupTooltips() {
    const tooltipElements = document.querySelectorAll('[title]');
    
    tooltipElements.forEach(el => {
        el.addEventListener('mouseenter', function(e) {
            const tooltip = document.createElement('div');
            tooltip.className = 'tooltip';
            tooltip.textContent = this.title;
            tooltip.style.cssText = `
                position: fixed;
                background: #2c3e50;
                color: white;
                padding: 8px 12px;
                border-radius: 4px;
                font-size: 0.9rem;
                z-index: 1000;
                pointer-events: none;
                transform: translateY(-10px);
                opacity: 0;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            `;
            
            document.body.appendChild(tooltip);
            
            const rect = this.getBoundingClientRect();
            tooltip.style.left = (rect.left + rect.width/2 - tooltip.offsetWidth/2) + 'px';
            tooltip.style.top = (rect.top - tooltip.offsetHeight - 10) + 'px';
            
            setTimeout(() => {
                tooltip.style.opacity = '1';
                tooltip.style.transform = 'translateY(0)';
            }, 10);
            
            this._tooltip = tooltip;
        });
        
        el.addEventListener('mouseleave', function() {
            if (this._tooltip) {
                this._tooltip.remove();
                delete this._tooltip;
            }
        });
    });
}

// Notification System
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.innerHTML = `
        <span class="icon-${type}"></span>
        <span>${message}</span>
        <button class="close-notification">×</button>
    `;
    
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: ${type === 'success' ? '#2ecc71' : type === 'error' ? '#e74c3c' : '#3498db'};
        color: white;
        padding: 15px 20px;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        display: flex;
        align-items: center;
        gap: 10px;
        z-index: 10000;
        animation: slideInRight 0.3s ease;
    `;
    
    document.body.appendChild(notification);
    
    notification.querySelector('.close-notification').addEventListener('click', function() {
        notification.style.animation = 'slideOutRight 0.3s ease';
        setTimeout(() => notification.remove(), 300);
    });
    
    setTimeout(() => {
        if (notification.parentNode) {
            notification.style.animation = 'slideOutRight 0.3s ease';
            setTimeout(() => notification.remove(), 300);
        }
    }, 5000);
}

// Add CSS for notifications
const notificationStyles = document.createElement('style');
notificationStyles.textContent = `
    @keyframes slideOutRight {
        from { transform: translateX(0); opacity: 1; }
        to { transform: translateX(100%); opacity: 0; }
    }
    
    .close-notification {
        background: none;
        border: none;
        color: white;
        font-size: 1.5rem;
        cursor: pointer;
        padding: 0;
        margin-left: 10px;
    }
`;
document.head.appendChild(notificationStyles);