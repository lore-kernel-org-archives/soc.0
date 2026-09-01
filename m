Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6779A48C3ED
	for <soc@lists.linux.dev>; Tue,  1 Sep 2026 17:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284897; cv=none; b=XoJC/4NjCbfq4TLgiTczQVkbglOHf5Q6I2dxHvJgE8igQSkm8FeCEWRfEPtelS5SGojPeUcYwwc2HT2OhDL7E3xSOINqKGq/CQxJEw9k+HHI2vjybBd57Wo0ULVeqorrt4AfqJmBqBruOBBUlnEeqyPuqrFUZwtJdmUnaXbAn4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284897; c=relaxed/simple;
	bh=vfQaj9ly6LhRgNLfN+7UahmQXADGA5101PUjRoWcTdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3htxcxLIMW8Uyrh31ZpHp6Lc1PSZEyYBMaLOjBHzxP2H7aOa/tag9wQmNQtGlVebmWDKYeyU7bLCbtUyKg/+fdXyAzlvyYBgLrcd15ddkxy9SDECm19dr/pI/xfNZEe3EDrwlHLA2W+hCxAuyIfCgXCS3YRXaEGz3zVM7r8/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=mqnNQjVu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="mqnNQjVu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso307195e9.2
        for <soc@lists.linux.dev>; Tue, 01 Sep 2026 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788284893; x=1788889693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0l43AVlC6vAtGNyUJOGdQyBhYz3ewWV5F6wFrMVKpks=;
        b=mqnNQjVukOSxfVf/9xLq45cwrc4CuSWPQTDzYgguNj6LXRFM3tvKv4QI9/GrSY/Dnt
         i6rbfGy7SEALWu8hmbpY2QurK8xHfJK9g5KwyGiSiBgvdH3HT0g2R1wOAq1UbI61lD9d
         u6YG+D3gYZ2UQKyuhYQzC2QgNm3UV7V8ERvA/zpkL8OIZepzw9OdGKNaobG1iymRvzqO
         KGd/rWhYmw1bEw3viK20Op9Jp0qPlU0qnKzc8+MMOx9uXeWqsWFGfaTDMjokmloeJ0W9
         AsGVqxDEhdiNAYCoXYIwgmogo17SUJx96gAksZfYDObhojyOBaB7NuC8/QZt1dWxXq+/
         bXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284893; x=1788889693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0l43AVlC6vAtGNyUJOGdQyBhYz3ewWV5F6wFrMVKpks=;
        b=RYMX20KL4z4S3f2lxGDGK3Jo/x4ub9npDfYWKIFKrr/v4AUJ+9nJqhBHqXsTAO1vsj
         CnADffdE/ogY18CUDjGN43mOqzRWgZa3gXNVFvSeqJExdamTfEGCgFF9s6qALoI/K5SR
         ItZ16JlPzr4hibeKZpkt1hagNXydDJDJtI00iL5cRCb/U3BeLIlCvudTLcDE80hswGyh
         KIC+Hxku9BVEPLJJtLd4BXzpKrKe3nFVyVBjra+sL/tb/w8vcKE/gdXkJzWdaVUgxscb
         G8uTNvgNNPskdPQ+m9T/kFL+xnBjVdc7ljsx1pgVbxzISigxBLgBa339nEdsA3hlNMOW
         f9HQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPVmWFc24xqP4nJhw5TDYNy153vcZIK2w/hfyRgM+oIobpTPgL7TmNmEXzQa6sstHafz0=@lists.linux.dev
X-Gm-Message-State: AFuF++m8JA2V6Wdmfl1WrGtWgWisoUouR8nYERUTDisD9WL5d+b4Fkgp
	3fGUdc9QJi346KNk9DOFlLYZLu2AcrC8KxYaaDXjbl7caPTkPGgGZDll2i3Z6eQxYQ==
X-Gm-Gg: AR+sD11AN3KDxm6e3c21L2cr9WCX+nFaB3NOoZvu+y7psYv1CntIO63/5qDkOa+mmS4
	bsJcm+49kTGPliKxaDrPvhO3kEVuACWDLc5i8vuyPu1B5KfVylhoDWB+aMhtASrvDKCQKUpso1r
	lKvaA6HeALLLT5TChmQd4bCwZbC9gftoZzii9BEMbPDpCPqF9qG+UZYYwRKzTJBgs9WnSTB7RGN
	3i/jMTJ6IeT5V9XTV10M/JzzOxpmVdbt7z15xqWGQYq4a0RGjezgIDtU0Wg1HcTXJpQfytTEi87
	wdwhuSlTPuFyLauDNR+66ruU/IL+wIAI72mgXhnSpsNknBixmQ9ahfmY9YYohVCe9c7oifjl5N2
	XtbIc2RYz59vDfO+YWFYOHeVTrCpXRAyFxFHW0LCgw4Dlq3WdpSzox49NYSO++P+N53WgNaoflO
	KF91zPMfwJWWV7vlx1h0dH8OwqvkckCiAmeN01YZfGZdwbQv/vC7FOBi+0ujTc4j4WyXLJ0irab
	tOAHJ4L0Eigt1U=
X-Received: by 2002:a05:600c:4512:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cdc14d69dmr178611345e9.3.1788284893038;
        Tue, 01 Sep 2026 10:48:13 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm2369225e9.14.2026.09.01.10.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:48:12 -0700 (PDT)
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
Subject: [PATCH v14 3/5] drm/sysfb: Update coreboot framebuffer Kconfig symbol
Date: Tue,  1 Sep 2026 18:48:04 +0100
Message-ID: <1748b8899ec772cc435dc57dc55f76c15da95f0a.1788284852.git.sean@starlabs.systems>
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

The coreboot firmware directory rename introduces COREBOOT_FRAMEBUFFER as
the user-facing symbol while retaining GOOGLE_FRAMEBUFFER_COREBOOT as a
transitional compatibility symbol.

Make DRM_COREBOOTDRM depend on the new symbol. This keeps the DRM
dependency aligned with the renamed firmware option without changing
runtime behavior.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/gpu/drm/sysfb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index f7e48178885e..2bfcd59bfe6d 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -10,7 +10,7 @@ config DRM_SYSFB_HELPER
 config DRM_COREBOOTDRM
 	tristate "Coreboot framebuffer driver"
 	depends on DRM && MMU
-	depends on GOOGLE_FRAMEBUFFER_COREBOOT
+	depends on COREBOOT_FRAMEBUFFER
 	select APERTURE_HELPERS
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
