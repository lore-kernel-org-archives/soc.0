Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E23E23C50C
	for <soc@lists.linux.dev>; Tue, 15 Jul 2025 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573203; cv=none; b=sXUwPOA/i4WInhEIJ/gKHtZa9oaMe+dQSbJyfcS+v6u0Ff2hMdnKDCm5cbivwFHs4xwxfL27I75E1oYiKzgmnVmNZp7Opsh5K/x5+3F/uW47oShssyWnK6yo+tVdCzRMWJes1qyYpNShi9RHsAVUB6p7Bit3PgY5YkkGWE78ssI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573203; c=relaxed/simple;
	bh=hdNF87GV2fWePmslMU1NtQufudv4sfo++yaOq7Dlqlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+sh5cpYg3ehHIGUg3z7WvDW6x1a4q8XgrP9laVdWl4r2K24M3tWn8h6VDABsQ2VmBil2aNAmn5ZBy4KNSJuHFy1cvJUmVKdUV45uoh8he5gM8jg+Dr+AXM6TLoQqIm4lfSA7xO+QF3jDkjXQjcUcKCj5RofvGt7iiswJ8Rfslg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H63LA/OO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H63LA/OO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-456127fa3d6so826135e9.1
        for <soc@lists.linux.dev>; Tue, 15 Jul 2025 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752573199; x=1753177999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VQFCrQS+5bGchAPhyltjjz6iBpc703vtRLaUH4uJQU=;
        b=H63LA/OOlPq4LHPQzvqMXrX0nxByTZnvwB1XrOHLA20Lt8J4LI1koEvohsx3CMOIGP
         muXcTR47B3C7jjHeV2Ei44ZssIdylfJosUGEVmcGiG3LFKA/vxusJ6xRTFAufaIFYZaK
         dmBVuwckXD1+jwfKoWjZF9IzKU/x+EmnxEsxnOJHAJwEfAN3bSQ1aHdLX60Z9ChoYhWI
         PjoVhkRlZV6eeX0Wgzp9uoLn6vIKrUCctyXz0p1fLwGOM5wubyGP9VzAZPiV6PlM1qeR
         m41/6H0qrMA6wrF3G+bzb4yibMs790TbYOjzbwG2UCueX5QL5whj7+kF1EfvpbF7XhXH
         CDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573199; x=1753177999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VQFCrQS+5bGchAPhyltjjz6iBpc703vtRLaUH4uJQU=;
        b=M4+qh4HwCqVVcg1M2N08PL23TXQSUCt8dEUWEYH5Sr2KMl74gAAoX+sHBNpFkC1w03
         8KdYV+OFIuoooh+cuGDuV6fTS2roxIN0Sfotirn89sY8h9zwJp4k9v2C7FC6mGpBs7hX
         +MT1MSMon9mNktIgy++iKJ2ikq8qAQN3mjWYIqUd77p5sBzc0JvHgRdn/D7+SGGjNKiI
         iwtDLeXalXMxcQ2rGFtTVDW23AFON5U5BaWkocdlOIfEKB5SPtchVwCedVHZErAwlS7A
         UaxarghxrkVLVlqF/rQmr8gaaOQBNeMJY3KVtEoz69BjdC1W+I54gE7H09/4i8fzH8bU
         EvpA==
X-Forwarded-Encrypted: i=1; AJvYcCUlzSzWM2oGaFAlC0tm2ncMGo7kN40teYvmHJzDyjhi8bZ099xgUtb5iYEwB0n7Cr08BeI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJSaHV/0lSTjA6smCGvtW6nzakyzIgq5BPv+U3F7ZGskO5jDkj
	pO0qLjPWouYbn/LYyK6WHX4B3ur+CI9nN9KKh1Oi4L/VpQcr/D/4kui8B1Or0oLoNUM=
X-Gm-Gg: ASbGncvqeenTg4TFQniW3HryL7EZCAdvZ++SksgU9pc8Euw05RUZCTh7pm9iUQgwgQm
	ToXgk2+IX5aEAy4ixhiqnRf69zLtNhNzNqQ+Qvg4F+9vYAoLEwEM2gbUYAyASiYrkmA0rZqchZu
	PRwtfEV5vubCP1Nm9fGWLrt+2WQIHYZBcBXYKmt/BXcY4mFGX9RWMsOa9o0N6P6UgAnkFhNw4wL
	c78ALOI+fCyVn/E+fab7HLzCtWRn0diY4V0IsjjvxkDYntSoGEq69ASPSqmmioy/nwDb7dHAiIz
	q2+HdK96h6eROi6wI4BuAyhoO9mZGAu4FN2ToZ+/XX7skfjNaKTs1dZ0K24+y1Qkmvc0gc/Fgev
	nra9PZuswh2k9GeKTVymqMmR5ofy+42+yz38=
X-Google-Smtp-Source: AGHT+IGs2CckTXIolbdnM6YkcGeVbCoECGd88RrOnR/Gtlb5TjwgUc93KCulizhEe3JrwuaSZK5Kwg==
X-Received: by 2002:a05:600c:3b88:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-45629127ce8mr4377775e9.1.1752573199432;
        Tue, 15 Jul 2025 02:53:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-456114a417csm78548155e9.25.2025.07.15.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 02:53:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.17
Date: Tue, 15 Jul 2025 11:53:15 +0200
Message-ID: <20250715095315.59299-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=hdNF87GV2fWePmslMU1NtQufudv4sfo++yaOq7Dlqlk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodiULNenkUQzM1iNZM10NYbU29gK+VYrKrcqI5
 bqU+sYZxmmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHYlCwAKCRDBN2bmhouD
 1+muD/wKwp0dL06Y4+v06hD2jgWUNk+0uO91jiBFPuDw8bI/Y4jbeJlAupBVow45cte6n2nTYdk
 gQrK1sUHtYff37PyuzZX6NSylw+aiZYHxS1zMvLtCERSxHdrIcqUSfvGekYRCp+pL3NVTrk8Jfd
 DG/2nXJt0eHZ45Y3KjwrgAwYOyoSqsj1TH0iY/gbaAOOZQB59x5EKNhcUD6GY/BS9VtJmQhEB00
 IUnaWplezZlGIW4v/5gh9BJaXJve32NYN6F9jKDznp50kMdWUoaDMnMmBjnQ4LNhrFo0XE2bKU7
 7ZWt6DRtyQReyRZHRf67lMlswn+ZHbc7h/sJAsgATBHn6l3BKNUENhWYoJc7LKGM1RIKd1Q6Pxx
 XZEx4vDDGlOcZS6Wj1FOWK0tN1L95+J+JoOTPm6YLJ/Cs/hk+PKBQpRcyIZ9L1wJrtyPEV7OIj5
 eAxgdgT2mRUnXCFxqh292qRWle+V4vXltrAtaVbkQ3gG8KxS6yNHYiiIq0wLCdQ6miOh9AhFKQf
 db8kct4PNZMahckb6Lqxs0xjB8TAXcOQF+WF/MuiDeRV0i7IHUXXqvnREDSNEFXJimfVGVybxeX
 SadcZMByUEfmicTKb5XbSF0AC2LoLQxSoRhuarMcDsihO+on4/UylTqDi6HhFEI7LAk2m+LS07b tVEZQgYXYsP/jdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.17

for you to fetch changes up to 93a7aedc4cc4476da54ea45f3ed5308aabafef75:

  dt-bindings: memory: renesas,rzg3e-xspi: Document RZ/V2H(P) and RZ/V2N support (2025-07-09 20:23:59 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.17

1. Several cleanups: Use dev_fwnode() in OMAP GPMX, convert
   arm,pl172.txt DT bindings to DT schema, use
   syscon_regmap_lookup_by_phandle_args() wrapper, correct kerneldoc.

2. Mediatek MT8186 SMI: Extend hardware bandwidth limits to fix VENC
   hardware during stress testing.

3. Broadcom brcmstb_memc: Add additional fallback compatible and
   simplify device driver matching.  The change comes from Broadcom
   SoC maintainer (Florian Fainelli), thus its ABI impact is
   acknowledged.

----------------------------------------------------------------
Florian Fainelli (2):
      dt-bindings: memory-controller: Define fallback compatible
      memory: brcmstb_memc: Simplify compatible matching

Frank Li (1):
      dt-bindings: memory-controllers: convert arm,pl172.txt to yaml format

Friday Yang (1):
      memory: mtk-smi: Add ostd setting for mt8186

Jiri Slaby (SUSE) (1):
      memory: omap-gpmx: Use dev_fwnode()

Krzysztof Kozlowski (2):
      memory: emif: Add missing kerneldoc for lpmode
      memory: stm32_omm: Use syscon_regmap_lookup_by_phandle_args

Lad Prabhakar (1):
      dt-bindings: memory: renesas,rzg3e-xspi: Document RZ/V2H(P) and RZ/V2N support

 .../bindings/memory-controllers/arm,pl172.txt      | 127 ------------
 .../bindings/memory-controllers/arm,pl172.yaml     | 222 +++++++++++++++++++++
 .../memory-controllers/brcm,brcmstb-memc-ddr.yaml  |  54 +++--
 .../memory-controllers/renesas,rzg3e-xspi.yaml     |   9 +-
 drivers/memory/brcmstb_memc.c                      |  56 +-----
 drivers/memory/emif.c                              |   1 +
 drivers/memory/mtk-smi.c                           |  33 +++
 drivers/memory/omap-gpmc.c                         |   4 +-
 drivers/memory/stm32_omm.c                         |  21 +-
 9 files changed, 308 insertions(+), 219 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml
