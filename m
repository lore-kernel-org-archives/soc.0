Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6F24BD00
	for <soc@lists.linux.dev>; Thu, 12 Jun 2025 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734139; cv=none; b=FBIv8eKrk/ngV0OvLsOP3/9dr+JNaLfO9v67dgKT6MRW0VJJq4XXgmRg7oRzEM4f9ZJaZHUYd72pg9zj5DrTutX3QkxIap2X1E/MjBXjHEzmSALkn1GcJmMEOXEj9mYhLrjfhC8Z580KYWzJZ46YJV5hCb0SMSGbeQ1os7cGK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734139; c=relaxed/simple;
	bh=pcmGu317gTZwAy3/dan+A6JGqZDrA3MuzLVFRN4QaD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6wBeUHfdgI6l7PURajFTudONFvJh/aMFbZe12wiv84WSHfnrzQTXzwzP/fMjEWY+gX0hMaWf0x0oOccPak9/v14q7wf4l6k6I3jeCqwHBNOTqwE6BYmNvBK8kTfwILRDD2+L7T7YaUq01lDOrfwy63W50YY9nHRKDvGFDVKxZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MucIbPAr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MucIbPAr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1509950f8f.1
        for <soc@lists.linux.dev>; Thu, 12 Jun 2025 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734136; x=1750338936; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5mo28r4bSLhtRxKleEgwjFwDjbfBKbh8TaaOWlq67M=;
        b=MucIbPAr2jpkt6RXRsCAjJ+WP63MlzGzWwJZuLO8PS42bELdkzM/porWLH7G9JFZ5w
         LnnkVNHQL4mvMCS0dCqOCX2EmRc69jC/CuF+4W7YFCkky9jzKHahjrwJKBy6IDKDiszI
         sqse0OynSnotE5lP7vQypZEHHdfs824O0komP59nLVlbyG5ClLTzbi/7iaJotl8OdJli
         PufjRRrZ2fWlGo1WsXQd3dytG9TbghRJaQBpsxAZcxI3sc1d8vPWgYQXi/WwU3yiWGy2
         KidNf6Bl6FXByfu+Zlm0Y1+b1hKtrEY5OtKNq3JGXCnhjWNKjw7Qw8TOBXnw+Ibc4HLi
         AqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734136; x=1750338936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5mo28r4bSLhtRxKleEgwjFwDjbfBKbh8TaaOWlq67M=;
        b=ELye5VYBpf6Y16C5fgsdkkqulqQtyAGCi5nj0ogG1hZnifuaJ6XOBXJQKe4/fsn/lp
         c+Hp6QcwuXBpOtxBEyxf9GZ9i33yQl/6nFlQHAPmRWhoMjYO166R7+n6lwwj1OjJJauD
         h4EvyrVOTo3Ve1h9D2dJ6/hlKbTkJeAfdRO9aFs11ewA7z1CPfdeIYjTzGXoSD1Z5fyr
         4EPdCn1SUeentUwVDbkzmrMLsrSnphVhcsMGAS8efFmNW11scLhi7tfiqXZwHpgkuAPj
         FAsQqRVY7a2aq7hTS9pPbP1131ZXaogo0MVXU1DVAUw2ENauRIkIjG4X0mlHewz4xO6A
         AoMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXxQGmhojeBHTr8dCt2o1kZlviHDIr5bEUoJgauOOJgYmZMoPwT1e9/m3v852ZLbTyTgI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8bqzcnrcRjYjVga6ekLnKUoRrjhNQ/HDC2L3Yr1tWxLCs1Lh2
	elUjZzFXj8DWEFfV0y/4i1ZUrpZ6cYdJneE31mJmzVUoKWK4oBEy6LaecSlPrYJOZtM=
X-Gm-Gg: ASbGncsbUNob48IR25U6SdFey7vkJE43+9RgetY+O7Ey+UQUYauxzptFQC2IlqDPeo2
	+oNf/1z17HxZlxPcJHRWbsONmZhlGFzwQVK9HMuOsrDrQnLcDr3fX3A7rG8s4qCbSNP3Q2fMr1Z
	fzN5stokQVhfBDR/g4FaruCnZKq6XdINYyMCRUVLraeES5HmYiWB7U8NaQwSe1UkbN6G3fVakZb
	kcXiUnlf0gjVuhVXanRTcujdtaZANR7WEg0AhMMLoMCllOUWxSlDVHG3JLNogpJ5jSMQ9Wcpnu8
	xXmIY7OT8iLPA4iiZtcx9Xuq9NZoDiqnwcE/bCI8qX6Zl4DYbuTz5Rk=
X-Google-Smtp-Source: AGHT+IGBzR2mvuzoTZVHlKLwIjCRQmPWg1494+jjoGTBRb95NjkbBovSMnn1G3/kvKyntrJFTjslYw==
X-Received: by 2002:a05:6000:1acc:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a5607fa6a9mr2706309f8f.16.1749734131666;
        Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:18 +0200
Subject: [PATCH 09/16] pinctrl: digicolor: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-9-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OQugchdrkWqDPvdem4KQYa6SyzhpAo4iCK+GSkQ42zM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLm65xc3XhSAXLjOYJrRx8iTF6Z3NPsxp5s+
 otU7k+QhaWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 cpxgD/4qN100OY/e/Uz3KaPovCgsqpm2wpUtbSiYEFHBmHRBGLuf3ySBpaIk66jUCp2HK6IC/Cu
 2rqLmWG+B1iFpS4BnVMqobo6XmQjO/ARjPAV5Mt5CaDoOoTOhpLoNchztmEN9Q2JKULHtTgCqhX
 lQHrPhbY/9i/5W0RbV5etGdJItUlMoySsE119JLcLNM/on+dOLWMt+O3R6OFQVbA2Ax1wh27sWY
 400r6LQeOyu7NOnJX3zbqfwN/N+J2L065B6bTivK6wSYzswkHHRl1mWBdJI08KlqfsH6XPgQFQw
 JX9YVFecSDqkoVn+ypM6aD02FboP/q3cvaaUBgxUNeZX30SJzwt52lsSpg1n+Tx4J77UuEZyss+
 GFY852aRZcZxAim54v/DC23tAfXW37EDYmRMBWXAr+q34Gz7l0YcsBZVHY59CfR/16FxKPEggg/
 3iQYJRkgoOkddEdzxoZ8j7F7myunohSmcOCpD5Tu7Ycpzt2nb9gQzdsAwZZixXN2jBJxs11uOSl
 KaDj1iHD+UyHxRyF4uxpTztdkNsHGKodkqbgajWh9wCY7oxvodduH64VwV96QA8h2NgxXxorrg6
 X3fbAgBNYIXJF2fF+V2DAOgvtIyTF7nNrlcaKu7z3fq0cycKeH7OGmyuh2ikwHlpBgY8Zj4s2kM
 q0e5Q8QmLCBxxSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-digicolor.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index a0423172bdd6d8600fcb56a542ef498e14308968..1676cb3cc4c98755d287d3d87ba682ffc61192a1 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -182,7 +182,7 @@ static int dc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	return 0;
 }
 
-static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value);
+static int dc_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value);
 
 static int dc_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 				    int value)
@@ -216,7 +216,7 @@ static int dc_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	return !!(input & BIT(bit_off));
 }
 
-static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+static int dc_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct dc_pinmap *pmap = gpiochip_get_data(chip);
 	int reg_off = GP_OUTPUT0(gpio/PINS_PER_COLLECTION);
@@ -232,6 +232,8 @@ static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 		output &= ~BIT(bit_off);
 	writeb_relaxed(output, pmap->regs + reg_off);
 	spin_unlock_irqrestore(&pmap->lock, flags);
+
+	return 0;
 }
 
 static int dc_gpiochip_add(struct dc_pinmap *pmap)
@@ -246,7 +248,7 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap)
 	chip->direction_input	= dc_gpio_direction_input;
 	chip->direction_output	= dc_gpio_direction_output;
 	chip->get		= dc_gpio_get;
-	chip->set		= dc_gpio_set;
+	chip->set_rv		= dc_gpio_set;
 	chip->base		= -1;
 	chip->ngpio		= PINS_COUNT;
 

-- 
2.48.1

