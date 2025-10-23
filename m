Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910323C4F3
	for <soc@lists.linux.dev>; Thu, 23 Oct 2025 22:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761258787; cv=none; b=Xq8ACQcqZZrErx5xn0+2ElxXqN46g/gv9WEa0SdgfVi5+48IKsecEH49ocl9ZpnHeip6onM3eUAaLeCXJiw42bgoLwkeyQn77Uzi+xdc0V4OVfXrNFzxG7Cba+xQqWiu3h+JdBNdyu7s3TStAuZVWLo0qwMRIELfDXf1MijOT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761258787; c=relaxed/simple;
	bh=evcIZv3F0HIpkyuzZ6LMCdf4AQWmSZO8+VHDR0H7KDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RUoZoaPmsd3vLcBn9cq4YyGSf7lXP5l+bI/Q1nZQR3kPGQWBtCjXySfqF3gotRcQHq9UU+mXzVDyucyYeM7FN7bz51huv4Gm9pR7dqMkptKL/xzkZvAnx7e+Zms1tgk7S4/v8fzXeO/RS9DUmsaIdNYirfAfVUuEODSUHSS3bxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEtCPUxt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEtCPUxt"
Received: by smtp.kernel.org (Postfix)
	id 37B64C4CEF7; Thu, 23 Oct 2025 22:33:04 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E455C4CEE7
	for <soc@kernel.org>; Thu, 23 Oct 2025 22:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E455C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-592f5736693so1378156e87.1
        for <soc@kernel.org>; Thu, 23 Oct 2025 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761258781; x=1761863581; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YfCV5alJTAHskvSEMsQJ4T0BY2JN7zrMWiro+wKilhs=;
        b=KEtCPUxtghVPRhacWOYDUsmSTNTjKQk2Ig+ygT4ZpyKZCXGI61s6qpmr+OObQSodpB
         dupcpLER3+SfCjhbY7bbXuWhwWqRJYohr57pP1b5l2DHBnyvZ7l3AcZjSWhAT+p427lj
         tTUO+pwT5fQAPiu6VAaD+v0XRO03sBd2tCJrNeSjkF71DQqEyNXRU4iUdRtKjOnYAPao
         4NQaZq4X+vz1CUYgh7UEeFazPbtF4Rslej4Xr6/aZeDuzFw4OrSgN8dWVW/SlcU/0mQ6
         aCNwjGtglbg81YHIm+Up2yZXc36iwz+jFEJbJM93ko0IFiazo1bD74pNy1zrJrBBjB2s
         uv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761258781; x=1761863581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfCV5alJTAHskvSEMsQJ4T0BY2JN7zrMWiro+wKilhs=;
        b=XPwQRvLNgI0h/qpPepAWyzJGCQR13lMxbtgyXCHlYO/B3ojmFxH6gS4TywheTyW9ng
         w9q7xSC8y1FgLuPASN+DzdS+e4cP84IIVRTwmbRg8GZhacc6X+6VwMhOnKN4huujCwlv
         XMwnSQ/XcofzBSiPLqIuWfzz+BnZJgVRmp1IpZA5YmjuYXnJHD+NBRM1H0LGurbXGgzx
         Pl7kUyT+241uv0kWonb8+9k4VuH+ScPGAO1Ltdzl0WN/tRiFjGXlPhxkcGMEQMOAyQpj
         iQSkLdTpF2S9lRC/5nicC00O/61r5sSXyUdh2sLM+U2YQs6w5jNNSMxS+LNHlYVw+uuy
         aGig==
X-Forwarded-Encrypted: i=1; AJvYcCXOIItQ+LD+I1nn2Pv4EhW2z7upctnWHO+fjzoCnm8CmCj+zHG5AOzcWvc34mYkcKIvrrc=@kernel.org
X-Gm-Message-State: AOJu0YwgoCeJ3vxyuwfBjQU+PnudyL1Zssoh4KBcOpw/x2URehXLSq+g
	qYfONj+P94xXD7V/rUD4ovVjHR607NCsWUy4u3aoBCs9JecWeTFPcgYmjZcQn5Z92kb5wcisRvj
	J1pcafhc=
X-Gm-Gg: ASbGncsIon3RwfDobqItKN50feIR0p44qYse849ufe+2aThR4WvYbJIPFmrCiNIWGNp
	gccm80DUDg/gE7R1mPl37IM3PfJxcyMXsrb7edpUFOsSc1m9P8iPqUyjwKWj5wYY4V+L3wyqMe/
	it7dEhy0st11GEGd9gK/oxZpOXiH8p1f4dl9IGk/M2Bdkzq1r97C6zWKVAIA6vwgNOdnnULnmoM
	JqEnnb6+TWurUax7/vPNKVQE5EnJhLocLBj9lrULBY0IqyL4wk0vqEIyyvRf95DQGPeDyg95lj7
	RcFh8wQ90m0b6H+Ncpq6DDGBjAyngmeTZxaSJvgkEJkhJkbfWCDy3TvXewyQSgfPKbkyedf1pKO
	o98ZG39Iw5JURNNJSXWLnOYRPrcaw/MmcAr11uwSqnGOohX3aU4Gi1YqLCSGa9DiiawSvy67RR9
	nqKA==
X-Google-Smtp-Source: AGHT+IGL/agCFh5xcVpLpEm/hG8y8IfAB7SRELHSIgjuPn+ItQn5ngUOLCHahnegg/FAh3e1d7Srng==
X-Received: by 2002:a05:6512:230f:b0:592:f95c:4f92 with SMTP id 2adb3069b0e04-592fca59d83mr28871e87.29.1761258781296;
        Thu, 23 Oct 2025 15:33:01 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d16904sm1069156e87.75.2025.10.23.15.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 15:33:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Shivam Chaudhary <cvam0000@gmail.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: versatile: Fix typo in versatile.c
Date: Fri, 24 Oct 2025 00:32:58 +0200
Message-ID: <20251023223258.3181274-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivam Chaudhary <cvam0000@gmail.com>

Corrected minor typo in versatile.c
- Fixed "documentaton" to "documentation"

Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this patch directly.
---
 arch/arm/mach-versatile/versatile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-versatile/versatile.c b/arch/arm/mach-versatile/versatile.c
index 7ef03d0c224d..f0c80d4663ca 100644
--- a/arch/arm/mach-versatile/versatile.c
+++ b/arch/arm/mach-versatile/versatile.c
@@ -134,7 +134,7 @@ static void __init versatile_dt_pci_init(void)
 	val = readl(versatile_sys_base + VERSATILE_SYS_PCICTL_OFFSET);
 	if (val & 1) {
 		/*
-		 * Enable PCI accesses. Note that the documentaton is
+		 * Enable PCI accesses. Note that the documentation is
 		 * inconsistent whether or not this is needed, but the old
 		 * driver had it so we will keep it.
 		 */
-- 
2.51.0

