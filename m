Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5171E231A
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138833; cv=none; b=Npc1pZswAtzTuGs6DEgRqC8wthNZJa6UyToBH1NxSN8LNUnvUdzKNRlkvxZRvPwF4ZQWLXxQBc8u7oOT/f5nFM2ZuIyxa6d/srjZdTCcv4NvSMV/0wBY02I/sSbmdv79c4V3Ob7O8tN5o9NKN+/D0zXi0VGr9zScok3Y1EMX5gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138833; c=relaxed/simple;
	bh=BbFmuE0Bay8lPRZqwnXYNGxAGE2jeIUX8tiiV6wlK44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2Fnq25+f58NUCf8flg7WkMpZio2zji27HL1UhdEIlPVHfm1gzM9+Ca+zIIc0PmSTWV5hbO1YBmTkbTLNFn+wUKcHLjNmWyXPz84sqs2vmt0yAMBgpaBlX1wBPibgwrdrpktJ4OsSjpTgiFVN/v+0HDf1PH73WD+pI3B+5e6gaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlSAP+bM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlSAP+bM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so36858005e9.1
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138830; x=1739743630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8uXdpZb0QVP49WhVJeQTFaqN+VWPKe0SMsURklPfjs=;
        b=PlSAP+bM/nktG9oJcVFI7B73+bJaLbiDk130PeYOHpL986OITT29zTg9N2WUMehHCA
         MRBFUQylGFwf9SpcfXY0w6z/nS6NMkRhD8dlQSeEY8XPCgVuZhahKsRZSulCPcv/poYo
         CwJQuaR4EbvV7Ts6Js21DZ+2ZfqPMbKjLPL+2hKGha5ZEaUOg+CcKkfRtg8ifva0pY+J
         85eBcI4DNEkubToHRkbiZqFGg/uu+jsnwikRK49o6BlIPMNU6tOFp2anhxHULQl40Dve
         HHxDDpzzdnYC7TG4XlRSvNYjeYdbKbSacxzzPXDuKpyo36K8g24tqdZnw+US57NAEqVV
         Q3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138830; x=1739743630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8uXdpZb0QVP49WhVJeQTFaqN+VWPKe0SMsURklPfjs=;
        b=d0KmDhxElaPyUWzc4EmMe1kyN7c9gum77CCJwftLIu3hLIDIDFO+4paiG7f6a+TyTW
         QYQVvd3bL+XHeWEVBbqoxY+dXyR4gJafZ2hbjbnHquxyFlh0ycahuh1QsTh/ioUSO8Q8
         aH8Ay5wWn7FeyzU41IgN287CZY4oKpWs+r/nsf9kaq87NtnPCXjaTBi9EKuJeoOb+Zt7
         4TmTQaO0g+AZtZBt+rVfxsJn+QbtW8BchIjk3nTc9iemj2L/jdQ9jNG8IGgpPg/i1PpW
         UklG4V/SKDhGHxWBb/k/isTWZ8HuMivBUKvSVU3/ZcHJctYG7qbB9FJ37bP6VAC1a+eG
         QHRQ==
X-Gm-Message-State: AOJu0Yy/mpk3tUyh4HQBE1osDRitzNvHR4aQF7q8s3vqDsXwpWBsd/JY
	6KjwCIjGWDCoEBi3Lbg1zA3FBdUDD1WZN/sT5gECYhidM2XbdWB4+vQXBeoJ
X-Gm-Gg: ASbGncvCfJ/Ej9PKm73apHL1schRM0JUamx9ucjlTOjEjzUipDb/YZqPB/wIzKgyrw1
	S2jF1QevWWXbJOVZMR+AdSw9J3QrSqJVlu0QmAdD955BaprLsBTiW3Qad+531a0p0dofIZlPVxu
	17Tw7yxtIBFOjjvFniRtZPazPczKWL+UvifV3yID/+MietppIgTUsZX1V0fwglTCVToG5bnsSCt
	lURx8F1G99MD4CBuAKXPDmpp4CwjavHwQODERAXf+K1ZQClX2/ZbeyJ/slX7MKvII3Hpu5D0xYq
	Csk6wQYBdeH5m3hYYjfhlwq3uwvB
X-Google-Smtp-Source: AGHT+IFs/uD6uHSEXZaTM+eANebqsdHvVmdihPSPtESqNNdICu5h0lHig1CDm5zwmYfpbmncCv9HjQ==
X-Received: by 2002:a05:600c:1f96:b0:435:1b:65ee with SMTP id 5b1f17b1804b1-43926158833mr74064805e9.24.1739138830140;
        Sun, 09 Feb 2025 14:07:10 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:09 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 06/10] dt-bindings: mfd: syscon: Add Cvitek CV18xx rtcsys core and ctrl compatible
Date: Sun,  9 Feb 2025 23:06:31 +0100
Message-ID: <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These syscon blocks will be used for CV18xx reset driver.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d67ff26d445..5a0b102d1bd9 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -108,6 +108,8 @@ select:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,cv1800-rtcsys-core
+          - sophgo,cv1800-rtcsys-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
@@ -207,6 +209,8 @@ properties:
           - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
+          - sophgo,cv1800-rtcsys-core
+          - sophgo,cv1800-rtcsys-ctrl
           - st,spear1340-misc
           - stericsson,nomadik-pmu
           - starfive,jh7100-sysmain
-- 
2.48.1

