Return-Path: <SRS0=hxXt=3K=goodmis.org=rostedt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB0C4332F
	for <soc@archiver.kernel.org>; Thu, 10 Nov 2022 06:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85BD7C43143; Thu, 10 Nov 2022 06:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD26C433C1;
	Thu, 10 Nov 2022 06:41:11 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.96)
	(envelope-from <rostedt@goodmis.org>)
	id 1ot1Fy-009Edp-37;
	Thu, 10 Nov 2022 01:41:46 -0500
Message-ID: <20221110064146.810953418@goodmis.org>
User-Agent: quilt/0.66
Date: Thu, 10 Nov 2022 01:41:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stephen Boyd <sboyd@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 soc@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v6 1/6] ARM: spear: Do not use timer namespace for timer_shutdown() function
References: <20221110064101.429013735@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

A new "shutdown" timer state is being added to the generic timer code. One
of the functions to change the timer into the state is called
"timer_shutdown()". This means that there can not be other functions
called "timer_shutdown()" as the timer code owns the "timer_*" name space.

Rename timer_shutdown() to spear_timer_shutdown() to avoid this conflict.

Link: https://lkml.kernel.org/r/20221106212701.822440504@goodmis.org
Link: https://lore.kernel.org/all/20221105060155.228348078@goodmis.org/

Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Anna-Maria Gleixner <anna-maria@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/arm/mach-spear/time.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
index e979e2197f8e..5371c824786d 100644
--- a/arch/arm/mach-spear/time.c
+++ b/arch/arm/mach-spear/time.c
@@ -90,7 +90,7 @@ static void __init spear_clocksource_init(void)
 		200, 16, clocksource_mmio_readw_up);
 }
 
-static inline void timer_shutdown(struct clock_event_device *evt)
+static inline void spear_timer_shutdown(struct clock_event_device *evt)
 {
 	u16 val = readw(gpt_base + CR(CLKEVT));
 
@@ -101,7 +101,7 @@ static inline void timer_shutdown(struct clock_event_device *evt)
 
 static int spear_shutdown(struct clock_event_device *evt)
 {
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	return 0;
 }
@@ -111,7 +111,7 @@ static int spear_set_oneshot(struct clock_event_device *evt)
 	u16 val;
 
 	/* stop the timer */
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	val = readw(gpt_base + CR(CLKEVT));
 	val |= CTRL_ONE_SHOT;
@@ -126,7 +126,7 @@ static int spear_set_periodic(struct clock_event_device *evt)
 	u16 val;
 
 	/* stop the timer */
-	timer_shutdown(evt);
+	spear_timer_shutdown(evt);
 
 	period = clk_get_rate(gpt_clk) / HZ;
 	period >>= CTRL_PRESCALER16;
-- 
2.35.1
