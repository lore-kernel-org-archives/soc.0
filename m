Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3923848F841
	for <soc@lists.linux.dev>; Tue,  1 Sep 2026 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284901; cv=none; b=qCuu7h0X+mYSytUsm3wNhYc2SgLrIDWHwq3f/wpL1FZlVvoe0uXHoh5fOuR7MIpkCpPZQDqwFJDikhfj0/8Ni3/9Ru6dfszTA+1vFgUuX0egg6ETXiNDJlCzyc/X5TEKvjJwt/qdaKMw5DouLvbRKPofbw+2TDP6+GvcZRQN3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284901; c=relaxed/simple;
	bh=2Ybla6Y62reZI1CmxWmKc144ZA3IjT4POIfUXQKsL2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dre7VfTbYdFoFYjGkEeG4icdPebtK37NambXh+Ci4azO78Xvl8rir3PzXnX7ygxAHX4+CmjL4rWDYhWJOD8plb3MjqAz8g7Ckhfgf+avs2I+lTVUUG8p0I3QC5RuwHDDdvOt9DKW3/eWdIbFmsU6aoyB66tFiWP9hDFYDVY232U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=AlmDaA6G; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="AlmDaA6G"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so466975e9.2
        for <soc@lists.linux.dev>; Tue, 01 Sep 2026 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788284896; x=1788889696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ybla6Y62reZI1CmxWmKc144ZA3IjT4POIfUXQKsL2w=;
        b=AlmDaA6Gk0RaJjgX3LOV+frw5v+0K3O5yU08r1GdkMxkzzHjLTEQa6m+EdeAYmxd/F
         ERIkbI9EzaQfEE9wEmWppGivA/7uyuSEhmFoZnhuzculipN5f5vzML1em9yfuLSKTs5X
         uDNiv4n2sMWySBEfblIGYwAMl0aDIPaXUkKsbIxQOnkIl6IXxjm0bDFMjgE2ak6yPpM1
         fbsdPzmV37zAQEuONec6tYe5p6haKJi9jz1SEPQLAlSNH7gTGncouRFLfCOj5oh1ViP1
         F34jnCz+NOQ6spoHfv1LNomITHF7eHepZ3OIupsdInKbfIq5IevPbq2EdJ+pG7bnh/ft
         p0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284896; x=1788889696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ybla6Y62reZI1CmxWmKc144ZA3IjT4POIfUXQKsL2w=;
        b=dyGnTwmqZsihUS7T7s/fFoFGnxWWgXe62DOol+wudsX6BOB7dkRm931LT2PSjdpibX
         unm3wQQOyqL1m0uuG4w2ghPb8Uag28Zoif6TtzFuAXyXGlf8w2boVYU75nwDUcV7MKQX
         /tyoz7w4pLf2vIekfaHsrTVog2OOgxyxKb4RB0fvbmLyVTIe/wTR9A8FZrZkkpmXun7N
         156AZTQRQXqVsMnTcaj3xfaSFnAs+t8sPZFc/usEJy9A6oFZcBunvcynAmMWiIzFfOHA
         n4I6/VJywoa1J8Ud9NBhcrLceMR7MdMRZ4VlA/WcQHuYC3zUlBrDu2rbK7AawxV7wRQX
         htJg==
X-Forwarded-Encrypted: i=1; AHgh+RqtzV9rmin9nNZtLm51keaVUhs4tmme0+R8ezKHju6utHhegg+M/asEf7xlnuQaT/IfQhQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lVcmJ2fSlwC4+TCyY9WYdWuZWN/bNWSEJQLhxBEzDdTbLAqdIJ
	8PqZ16Ib7Uml02BZHVke3wczsuLFY5h6om/Bw22Kkq7iDfsa51U6CtGF+BlN8TA0lw==
X-Gm-Gg: AR+sD12jz6bC6q8YIPi15ZidHtARowaOJotRW9OtJWe2ClRaKUuxP8c1WjUEc+TrRpv
	Y5ngG86reaaMrkd9f5pqPIn6l3p30RNV0iGKeW6gPqfnvGhW9xZXktcryRf/c+Nl8oBEBIz/msG
	Kd2uDv/bKuiLYIG/CRVP8GCdN4bszFDM2TIAvwoqUlD2XnNmA32+hlvl9Mqif8TIa/Zf7z3yPUO
	mwXRquUf3ChI1d9y0Q5PH8AO0/QjwC5T5nf8/nTMapD3GPDhrkOT6rr9EZxt/hlci99YsFCOW33
	0aEjZi7LFIHLq9AQwItJp5j4Qf7Ac798/EjUwdYlWIw6dd3gQB8xH/+CqeqPCLgnR23v+waV8Vu
	23UARowNZaohsH3NS9nwgqGzNs4HiC8xlEGBpGxKhaInL7//Dqbt2X8yYY24gd7sY5s7IgQiWT5
	CFZKMjzk6bWNekBna1bMLq0s9FKIJDMHt41gK9VK2xxeARgcP9VimVYDFa3XTRBgdKolpB46NaM
	FzHQYyBfXBDVYhoY/g5jMvkmw==
X-Received: by 2002:a05:600c:8107:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cd26ad005mr380287175e9.15.1788284896231;
        Tue, 01 Sep 2026 10:48:16 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm2369225e9.14.2026.09.01.10.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:48:15 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Yidi Lin <yidilin@google.com>,
	Kees Cook <kees@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	chrome-platform@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH v14 5/5] arm64: defconfig: Update coreboot firmware symbols
Date: Tue,  1 Sep 2026 18:48:06 +0100
Message-ID: <72952b598bd73ca282026139e4a1db7af89c30ba.1788284852.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788284852.git.sean@starlabs.systems>
References: <cover.1788284852.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic coreboot firmware Kconfig symbols were renamed from
CONFIG_GOOGLE_* to CONFIG_COREBOOT_* while keeping the old names as
transitional compatibility symbols.

Select the new names directly in the arm64 defconfig so the checked-in
defconfig follows the visible Kconfig symbols. Keep this separate from
the rename patch so the configuration churn is easy to review
independently.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 arch/arm64/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..90a7b49d408b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -267,9 +267,9 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
-CONFIG_GOOGLE_FIRMWARE=y
-CONFIG_GOOGLE_CBMEM=m
-CONFIG_GOOGLE_COREBOOT_TABLE=m
+CONFIG_COREBOOT_FIRMWARE=y
+CONFIG_COREBOOT_CBMEM=m
+CONFIG_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
