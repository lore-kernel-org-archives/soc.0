Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C102B51DAEB
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 19:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758329; cv=none; b=FSO0GwQCSIdojdP06RavJ5O9KhJIjKJQHqjgKeVREY7PX/JYhOscGeQpTCIHNt4jQsELavOCi1ZmFx3D4K7K9Rp+uVtHaJKtLGHYIaArJwmjkcuJmhhmjCyDgIkoRbozHEucOADlqg7ac0Dr/vQ8XkUMHYf9okOmPFWb3Z7eL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758329; c=relaxed/simple;
	bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SmTsAXpGJ3mfv5lQLbCmZNsUZw1hbaaeayYhHKgX/w9jN6LNeZamNxko7O1vy3Y8fPW6kokHFpciicCdafoBmmJh+jcwSk1iJOfkbXrhlLYRfMgF06qxdSoUG6rIpozXwlNXPFO6jyMEAWmcZQktCcMQExJms/G83z936bCYF8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6089tLL; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6089tLL"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6056c2064so1395900a12.2
        for <soc@lists.linux.dev>; Fri, 18 Sep 2026 12:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789758319; x=1790363119; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=i6089tLLEEDOp8GNenN+KaAO+RbDLI6kGFqACh4ULXh3N90a6u+e2WvlkV9Z/hUMhf
         RB6N6YXffOKAOut2eHFSx9waokBdZHfxvDw86azisHjf2QF1lulb31Le8Of58VeUuk6T
         bsV+TBWXp67DJubInIxr/iAVEOOY63GWeMJ0g/kE7Xz+DEdshtMhQy3hhbWYsdbBi58i
         27p/MDq0RkXkjWcNSW1+COHbSF21aZkQOBqHeVuAIwaZoXcyYQec+DA78RMMBJgFXg2j
         2gnLsvTDyhF86mDQ/uzOxXtEQQckIDri5lDQ/FrixOE7Ioyfyi/WIGzLtPZ8+od7Iw2f
         UcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758319; x=1790363119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=yp7IUL6QYvNU2VTLkXp6poN6AG3rPi4g3lpYhp1V0R6YJv77QMNhAm7Vp9KhZOpU9G
         xHwWXzD3KfnBYnxlA7clp/ZFfbC1BMrnpEEhRjNTcVCBHyAnddyp1zxc6IVs9n5311EP
         6EJ+6QoAGFwejOVKi1sDlTcFhokAoCwGBvEtaejFK9DH8Jqhwc9MWNPjqPz7RdjecoAh
         DY8zUXR+3zHLnQYmXKDIw1Jzp1zqtib8Olld952IHyD/HtHy4Cj96nrbgwFXAeqevt3R
         tgY8ScTcftGduuvEW1dFtliEkKCOj5uCPOAUXy+7xM6awYdXjgKUdlxO3Z/opXKnU207
         jm9A==
X-Forwarded-Encrypted: i=1; AKwUvBxlfwK8+BRsax4OuoyopUlbKHlyPwQBC1sAH9NF30Jx1l4pS6t5Hu4Lg497o7nDerJ0POE=@lists.linux.dev
X-Gm-Message-State: AFuF++mCt7aXFL+XgKCYoCuh2J8t0hNU5HLXdouxVBWBXtinM+1qHVC4
	nc0jJ0kzVHA520uhWeJMHLBtC9uFJ+cROWEjBaN4EDcZ6kAQGBY/Uk2K6ayF6QP6lxk=
X-Gm-Gg: AYBFou25TLuxQUSgI3oGWjVLd6mXb7BuSyraYj2YSyM1Awlm9fm5RBqFTUZfZK2w44w
	jCsse39YMtkWg3eKljn4M5hN1Dw/Olj6+Ec759Kxiah84A/GkQQfX7tvjh/oAGsQkO3lGr1LkhH
	2qYr20IBBk2XbklK7RZjdrMWyN+uOT2T//ZH/oan06tjrZwwoe+kJlLLR2Vwk6kvNF4Sa33cZa2
	0XX4ebRytv5Aw8Cifl5ur6QAs9V8XP4m8fl7JEITdiTH0umu2aDFIyPYgjGoAck29CjG8E29nza
	8PfrVI2e1QYptGWyd1hAV3BAeAtvPm21U423uOEA70i0hg1nVuPU0rvAtv6CQ8dEerOh9cp3jnG
	7FGKuy90DuaILsidbllG4Uw9PuYFE8IAe0XV+4504dkzSSY6fQE4kPR8TGWBTHoD+Zjdw4zr+67
	xl5oS+dKqE6In2fi5W0kDUYbjIXTI+AGWf0GIa4RCVvoKd9ohodk5eyGxo/soGEuOKDUnECvKtT
	us96tVcExvoENs2XLS9kLQEAWyKDimvB6wxJBHw7uOBrMMEz6Dp4s+wtVTsLYru82XewOQdLFU6
X-Received: by 2002:a05:6402:13d0:b0:6aa:447:17d6 with SMTP id 4fb4d7f45d1cf-6aa55ed94d0mr2176058a12.7.1789758319014;
        Fri, 18 Sep 2026 12:05:19 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm276250a12.7.2026.09.18.12.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:05:18 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 19:05:05 +0000
Subject: [PATCH v4 4/4] arm64: defconfig: enable Tensor G5 SoC family
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v4-4-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrYtrLEuMzp5hVqy3Y5ljELO858BUYVFUsn4vP
 b8kZdMyek6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq2LawAKCRDO6LjWAjRy
 uorND/9JewuaEszu0u6QZ9+I+xCJ/O8So5m+s6UZ2UyBKT5ujplVyBAOpPGGavt5xGJgjyobSEJ
 H9KtrlWGHOC7bApugiCV47Di21psrvzIZbiPer5NoArylWQgbG1f8ekKCOH3nDPnjOKkcb6C0Nn
 1BnkOtQvxDq8sF9SpqgEfuDE06ux+Pv02ruZH5Qd7+2y+ACmSNIEQCJETKKUHhj6JkWqKbMzU7f
 glDuPPlueCekv/ltOK8xGxKea/lbRsUvmqWqsFcMycKCB3+W4l12dTQ8PEdiBMCreyNOnYydKMm
 wSYKcJboYcbhqng2YdTnnZksYd0LKBwrBeVx8bM6Cq3y+uRMviYtfaj0GrRnFACqJdu/tXHtqlC
 zSd8tai4yxgEr4q0KWOHlZDW+cJoKGqiHZaRs7PX+r7abJkUB+Ju6dnXWrlS8DP7av7dk0fLtcw
 AN94OmE5fZEdrcSbehR1/ObFgANfc8VB/Uf2DAw+EUhEJVmKQOvQNdql1Auy5qwmHLg6R3G+5WF
 /lkNbrW4md8Eyu4Mx8yick+cOkLaR/ycnpYLZb+mNaGeRdKpaxgW07WCdspiDtmgTAFXpiKmwkm
 eGj+ZdtcUhrZSL1MKMIkhcKdwSdqQpGEFwck9AlzdPjoEMdxyyk+ayMPpC25O4FOPzQgarTipzV
 FQrAKZRVnfi8PPA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb66..75000c12ead03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y

-- 
2.55.0.1082.g2b9226bbc0-goog

