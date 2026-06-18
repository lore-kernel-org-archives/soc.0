Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816D22F8E86
	for <soc@lists.linux.dev>; Thu, 18 Jun 2026 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768436; cv=none; b=fnPtUTZYBw2aaExlYNEemVnFFf90K4rA9UqqMwKmwAJpnnBd+8F3p9Tb5x7YndxcCyyrWTIMJdiCQ/wuzr9RDJNk2k/nu9ik7knsUa6X6haKZHxg3MdC6jdiGgIQF8Mlim2l0MZ0HqIzxSbtEvyJzXXFi0TQZmUtGOCLP+jFsO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768436; c=relaxed/simple;
	bh=TLSPGn1X7APXd9mpj0fYFz1rYawux3LLayDrWOYO0ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nllhn8D3covTpwS3nuswdcE0yIu0Q2ALpSKT6nqKnhVvdD7BQdVNHqV9YFjxExF/orRWY4zb/R4q9kLcvYMWSA64eVV/79TG98qf0Kv0YEyXYh21YOBIbVEB6x6Ec/xKy7qlrdGEjIuMZZeUqo6VwiwImVp0LMhhbbqBMqdGKjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cK1LfgDe; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cK1LfgDe"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84229481d44so258860b3a.0
        for <soc@lists.linux.dev>; Thu, 18 Jun 2026 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781768435; x=1782373235; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjiRzYxjlgb1391C0ySksvTAaXp/63Cihk5oFrsX1z4=;
        b=cK1LfgDeyhcz/ngLDg4Rwx9unx4cEoWh537wi2+OMmlQtN5GoI4gvKYtpDQow1RnNv
         lMSoVxRB55Pqw7gvPZqGgG9il8iBOVB2/13ACe3m9CNYF6jrROV6ZYOJp0JkYqkJlPax
         6/7yF4T3tbhbsHVbrVn/mD2RWtsqBPc1PGNq0cMIRxSHuXGL0wTgY4JIcRHK0p9fEh7H
         8ssZdkT+RhGWzugyQvVyp4pyEZCGyH3j8TH/hTSBiboeuAQZptDTWaqyTikgMOvNkinN
         XtyvlKGUQUurutOIngpqoN8Y6AwH6aiWD64aydhZsf4hX0Nyw4VcDlaNXcGmmu/BftVc
         4rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768435; x=1782373235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjiRzYxjlgb1391C0ySksvTAaXp/63Cihk5oFrsX1z4=;
        b=d6Gepz/brzLXHR67CXWVxzHt1EQn+IJdiGjhH+5UdIMNu3VvM6sumoXJ14k7uHLPcJ
         JcEcwu7lFDcJ3RkBNIpEEq/xKventketK9jkp8uGDnI7L1kAptlm9LlhgJImxpY3mnM1
         xSxKboFXZZRZzNvDbXZqNnIeXSzODyDCU1MluytS5GNjEGqDcNX1NPG0Ov2xO1eIlKwb
         1oFi9+yx/SOTa7zwxRAuWNP33JXcrKoN7DoUbAeXT3NdeJRYmX/cyoBhONlgQ6/v0fiR
         X564GCUWcDQlCEHiVXqu5EfwAa8oIeJw87S+oNmnVUcO0fPa88b24rZ1/wPO8kgxDjNg
         aNWA==
X-Forwarded-Encrypted: i=1; AFNElJ8SlW1BHdrlWhhVkGGSnwyr8VG13wuUPoyFftJVAzCiAEmzjcp0hMPvsVDq4XibTcl12O4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYXGQeCQifqXDwkRoGEn80sR15jtJq0I0qzCyG3fazhbBh53gJ
	7C/ZGhYz7gE7d1yV97LOJPGsMY/5em/3IFTZlO2saFyCd8SUBrta+SiUyNB6fszuhB0=
X-Gm-Gg: AfdE7cnmpx69uESWDTQ8Og2M15wiFLIjszIVJ5XOZx4uwjDJhEDHj9NX2v2NAEUWZ8m
	8JFRGMIJT4Yv/Jao/B9hLQHlJKG7pohGgUX7WfAsyxvBgIhwV5b9FRd4qgmVAk4b8trXuAb6rka
	peY3hJIs/46hCUXBGxZSt2138Zb+Re/EccWCAhXffTQTkh3MA9Xk28VpJu3T6rqUI7NanrCdtfX
	Z7waCO6mrB+7FON00fIng+DP2+9FQeFdPCz1u3QKf186kOL8O82bG0IfeQg+RauqsJ0qLf0paT7
	BoxA2f8+o4l6Og4O+blJUnFd2fxahxrsUm81yZvomjJxqhiFruWKhg0GIXBlJXC9LCTHbeIM6Pf
	U/1BHAyXyMWnTPAQOrf48SMTP9O8wTgkJ/TwmQR2yMVUElAUfo75Fo8HgqtR29XNkXJqZhtYFfs
	/JS0ObE578vmoe
X-Received: by 2002:a05:6a00:cce:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-8453b0df8eamr2701471b3a.7.1781768434721;
        Thu, 18 Jun 2026 00:40:34 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17785056b3a.47.2026.06.18.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:40:33 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:10:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Herve Codina <herve.codina@bootlin.com>
Cc: Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap
 updates
Message-ID: <sj3oxg5ymbe2ac2geznsidsxz23rkqzqc4ir3pkjc7bsrzaorw@cw3waaj6xxkx>
References: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>

+ Herve (the last guy to work on this driver).

On 18-06-26, 10:34, Runyu Xiao wrote:
> Hi,
> 
> While auditing GPIO/pinctrl irqchip callbacks, our static analysis tool
> flagged the SPEAr PLGPIO irq_enable path, and we manually reviewed it
> against the current tree.
> 
> The path is:
> 
>   irq_startup()
>     -> plgpio_irq_enable()
>        -> gpiochip_enable_irq()
>        -> spin_lock_irqsave(&plgpio->lock)
>        -> plgpio_reg_reset()
>        -> regmap_update_bits()
> 
> On PREEMPT_RT, plgpio->lock is a regular spinlock_t and can become a
> sleeping lock.  Since irq_enable/irq_disable can be called from IRQ
> management paths while the IRQ descriptor raw lock is held, taking that
> regular spinlock there looks unsafe.
> 
> A minimal Lockdep reproducer preserving this irq_chip::irq_enable carrier
> reports:
> 
>   BUG: sleeping function called from invalid context
>   irqs_disabled(): 1
>   plgpio_rt_spin_lock_irqsave
>   plgpio_irq_enable
>   request_threaded_irq_probe_path
> 
> My first thought was to convert the PLGPIO register lock to
> raw_spinlock_t.  However, that does not seem sufficient because the IE/EIT
> updates go through regmap_update_bits()/regmap_read()/regmap_write().  For
> the syscon/MMIO regmap used here, regmap may still take its own regular
> fast-IO lock unless the regmap was created with use_raw_spinlock.  So a
> raw_spinlock_t conversion in the PLGPIO driver alone may just move the
> PREEMPT_RT problem one level down into regmap.
> 
> The repair I am considering is to keep the gpiolib resource updates in
> the fast irq_enable/irq_disable callbacks, but defer the actual PLGPIO
> IE/EIT register writes to irq_bus_sync_unlock(), after the IRQ core has
> dropped desc->lock.  The driver would keep per-line shadow state for:
> 
>   - IRQ disabled/enabled state
>   - pending IE update
>   - edge direction state
>   - pending EIT update
> 
> and then synchronize those shadow updates from irq_bus_sync_unlock()
> under a mutex.
> 
> In other words, the fast callbacks would only update local shadow state
> and call gpiochip_enable_irq()/gpiochip_disable_irq(), while the sleepable
> regmap writes would be batched into the irq bus sync phase.
> 
> Does that sound like an acceptable direction for SPEAr PLGPIO, or would
> you prefer a different fix, such as changing the underlying syscon regmap
> locking model or handling only the IE register path?
> 
> The draft patch I have locally is roughly:
> 
>   pinctrl: spear: defer PLGPIO IRQ updates to bus sync
> 
> and it changes only drivers/pinctrl/spear/pinctrl-plgpio.c.

I haven't worked on this for a very long time now (15 yrs). There are some
people who use this hardware, and so it is not removed until now.

Also I am not sure if RT kernel is a valid use case here for this SoC family.

-- 
viresh
