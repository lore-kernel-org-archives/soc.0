Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45225B2E7
	for <soc@lists.linux.dev>; Thu, 12 Jun 2025 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734145; cv=none; b=rJ+IG/D949ALf/mCRJS07eF/lbjrGZ6Z2dXiSCXgdvh97bs7jmy6WHJwBunjt/9EcrtrecFKok0/UGxjf6u9VQSnxcqiBcDG8KSaLZvIiPK3/c55busXQHXHdh5w9FdQiXH+B6FsC0iXzhiOy0nGt+03tj0GpSeTZSg6bfsdggA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734145; c=relaxed/simple;
	bh=zp6d5z1sYxwWEw/wzKNXZwt1zjGFDbts1CmdEZq0nus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpdASHKfs1RPABBSgsiDyWaxWG/Ift0FWdFAJFINGCAMide6jRS7HPEdVoNFfoX8D2KXpHSuyJpIRmDffT2t6E+DMkkD3fZd+Z+2+AauFop1+l5kNjeFR7QBTJokzwmLeUTDp85/JlRpyvqk9GDa6tO5FL4E07k73SQShUZD6bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dl1RazTF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dl1RazTF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45024721cbdso7995645e9.2
        for <soc@lists.linux.dev>; Thu, 12 Jun 2025 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734140; x=1750338940; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRVP/g9ETBrQ7ivNn5p21D3d98uF7eL3W+bgcNUMLx4=;
        b=Dl1RazTFbtBcBPbLxYAsOJyAmf7XdEQFRFwX7Gx90MltzaHk2WIxEoI8kKtaRYgjz/
         pgGUjHHeFHk2qFotk2X279sfvON3nQNEnHtjkV9Mz6EDIaLqxMH2v5Xb8eBmv6FCA4A4
         kn4tC6sisFJ2ClmpzA2XoXeMRYft+NsrYohDL9HNeUf+hQB8u15NFMn159yZdxBGF9p7
         L/mh7999Zt2g26YBshOGKKeQ2gHN5q+bZ4rR+xaevTlf2+ewOUyKmhg5ImPMAxYuoiQz
         /IANj2BIKbGDh6LHBncdxOuG6Vb5Ajls5AJ5JW9tVbqELTl1oWnXdyk/nvWlS2CV2N2y
         t+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734140; x=1750338940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRVP/g9ETBrQ7ivNn5p21D3d98uF7eL3W+bgcNUMLx4=;
        b=Ex1Ft60mM5Cm0G+3OqJzQ//34SW1e0kalwLVPXDcyuH0Z/9Hvbq8EUVApOBk7M7PUL
         vVChOgxZL0O7NYI8QQ9T78Ed1eLnIVsoY+ZuKWXjS59Fh/K93cxSXfcdasyNpVbg0ctI
         WYlHvGtBMw36+AT5NUXyUqLI6ESpCeSfX7GHG3RmNTlJ5SH7cmcl1hjgYsqEerTZKVVP
         xUkId6vj/v+IUD13kKruzgnnI5jxtQu+bi7ZCrm+30Zpg8LijspBxUvtYr/WXxDwiGJ5
         UvnTzN+xroI2gS/3XKK5uf+g9a+2m6RHr0wSP+MQFDHK28ibNdtHR/jBSuQvWrjmf0aY
         bpQA==
X-Forwarded-Encrypted: i=1; AJvYcCVXMPnbz4X9ozpIjG2onVbI3QzG1KRF0uLTICTPspJBwVla5fxze7emOUoJvtIY4GpCifU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+kegElkRU0J5gGWfqhqunttz0ehoSuQrCPN8U6GP110gZFZ1G
	9nOJvYHATr8iU1hlaY3Bj+pdtvDlKVlsNNWMWf4GIt88TFFIuQ6ZEE50MRfZUDGVMPU=
X-Gm-Gg: ASbGncvscyf/Hn0DunpSTYvw+gCWTH82SHQM6J0bxYa71/xKPtD2Kqf5W/LpHFgOPv+
	+K4SAKAlQwIeklbkG3UXmM4/x7Rqk/PoRMqOzL4fUv3q+bIfkmeougZAqA9oQBuywAOAYToqFqe
	crh6d6hOW2qn4A+7+PdaMmnHkY023WlPHr0aYpXqYZiSvHpmnJhZHefuS5yB9rFReYrXZRzLIQZ
	TPJm32qDPgKRyw++uB08yo+ltVW+rhOn4Khh/AcaInWKFKQ/aaeRLZr0pMvN732eytVAqzGw1jx
	obdauV7u4PjJv9NwooTrC0Srpy8zA7VNIo+YwFTvRaNqxvLdfWIBAMg=
X-Google-Smtp-Source: AGHT+IHSRKRz+S4AqZCA7nk2lBD5FvLjirlW/aLzXrlkeH/hiH8EEnGTppCPiobvVp5rFO/8nRH0ZA==
X-Received: by 2002:a05:600c:6304:b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-453248cadc7mr61464915e9.23.1749734140174;
        Thu, 12 Jun 2025 06:15:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:22 +0200
Subject: [PATCH 13/16] pinctrl: keembay: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-13-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uiWkBcfY0fL2/5gsJ5RtTL76wdCKi/XJJns8EXZp1Uc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmMUTq/R3HYvt1qPLJCXHDLlLJ2q7Mprw3y
 q+tW19o7dqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 ct8fEACqt7lUq3+S1tzRy8OrX4O3CMfw4nPrYnVysPwnIX5aR7rCUP9il86P5OxnBe1clhRmwf9
 HoPniYHRVUQF6YnI9EAGIDwhSUum1jbEzozs8EuWZ7akwxiY2lALTFQUB7pAw2aWqDQurWwASrh
 BAPCmHKNGQdiW4jPkj3dLIslFjsYCDyb4a7d0h7Rv4tHvOUJjwZTpmSlxh6jQhmj8/OnfF4FmSD
 A8SD5CTEpda8DN7KqBB1fsTu8o8/TRNLf1sa/DJf4UITLByVIfbtYMhfr/RbkMTCOa1I/Dca2/P
 Y8qdU4ZwwfmOTHnc/lA2TI6ioK5BvuhNtqvz4Cb1IEgG2Zlg+c5asL8lkSQySfaQCuWVBZ6+2Hp
 6pgnwuG0nSOllmDlZu6Tkzrd1ImxXcHfrsa02KtJ491H2I3Reth1gL1neP6RR6Nl3UDYNrcfUn3
 VqyShql609Nvgybzi+iTFSjRiwiPqG2yqgild3NQGG4yXE8kfSUys5UhBTzPaS5B8+VvpC/ZsAX
 xJfJ0KUdYCJumelmLmj2UUWKfC2pS9l4NPnQ9EqQOSiTnderpXlz7vJKNljTZW5Xz7ra3xmDff3
 VwRuV7ZIQrTn1lzp1FlY9U4bZ1Finj92YfG99YcWHQ0kTqN/Y0O3a7ioGWw4qxRszN5QakMKHOF
 J+HEqcwBsnDzYvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 0d7cc8280ea2168e69cf3d0ea415f6d2389efd03..622000139317e9dfb95e9a76f2478366daebdcaf 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1188,7 +1188,7 @@ static int keembay_gpio_get(struct gpio_chip *gc, unsigned int pin)
 	return keembay_read_pin(kpc->base0 + offset, pin);
 }
 
-static void keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
+static int keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
 {
 	struct keembay_pinctrl *kpc = gpiochip_get_data(gc);
 	unsigned int reg_val;
@@ -1200,6 +1200,8 @@ static void keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
 	else
 		keembay_write_gpio_reg(~reg_val | BIT(pin % KEEMBAY_GPIO_MAX_PER_REG),
 				       kpc->base0 + KEEMBAY_GPIO_DATA_LOW, pin);
+
+	return 0;
 }
 
 static int keembay_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
@@ -1231,9 +1233,8 @@ static int keembay_gpio_set_direction_out(struct gpio_chip *gc,
 	val = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_MODE, pin);
 	val &= ~KEEMBAY_GPIO_MODE_DIR;
 	keembay_write_reg(val, kpc->base1 + KEEMBAY_GPIO_MODE, pin);
-	keembay_gpio_set(gc, pin, value);
 
-	return 0;
+	return keembay_gpio_set(gc, pin, value);
 }
 
 static void keembay_gpio_irq_handler(struct irq_desc *desc)
@@ -1480,7 +1481,7 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 	gc->direction_input	= keembay_gpio_set_direction_in;
 	gc->direction_output	= keembay_gpio_set_direction_out;
 	gc->get			= keembay_gpio_get;
-	gc->set			= keembay_gpio_set;
+	gc->set_rv		= keembay_gpio_set;
 	gc->set_config		= gpiochip_generic_config;
 	gc->base		= -1;
 	gc->ngpio		= kpc->npins;

-- 
2.48.1

