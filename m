Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939A24E4A4
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225407; cv=none; b=uShSXAKkMJtQE7iMrQBBzq2cH9AZZ1S5JNqMH/b/GJN/DrcXJT7lKUlzdXN40lMTO0MfELmwjhaO06Mh91oOZZSIoXM8VjTECB50QXy+FatHETS2BOMxMV5IiOlMjVvQgNJDqdqXAAsNlwUNoUZIUCTMgh5RahzHPkBHsXwoUdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225407; c=relaxed/simple;
	bh=lAvoyba9xFl9uwuh9s7txaT9iZdnZ+MqsCE4z3EFFOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyFHczLP8uk7nXXbNSTC4BZTeMqieQTPwzdQb4fpKpYLxvpSeDB1vyNh++REV6oGnzRH1fo+vflyldR3O5yzEpcLXx4C9656V62DlPATLSHCxfRrVlbKxNjlBIZfnf46J+LE1XC0jgITJv1PSZi0a8NDx45k6ITtrh1q7TzGw4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0+E0XeI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0+E0XeI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so12146105e9.3
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225404; x=1739830204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTebZHS4gk5PFvDqlcXeMybwJIw7UkV3r+TMXWTUvHQ=;
        b=h0+E0XeI3Qc58g5QpDdcUxcY1La6BPbayNcSIjMbJ9gbYAkkr4bbypR9TUejxXTsF+
         RrPoKGyOOyswi0cs/BsFSGvm0vATZQXa+rgLzYm1CeQRDgXux6iS4w/reAN4Md1vxn6S
         SqCMUsLRGkvfFeVrdrV4qtpMOxUGFOUDTSf7fK76bfcEFAJg/uCMvHGEqktRbAsuHyw5
         9UvuldHEN2xpiNklPBd8yYcSlSE0VA9CnCjVPb5vHS2mKzJ5UpZiTGUi5r8h1Aizofzg
         fb5jk9qgd6z2TJNEIUa4DrE2VHkJodCGhDW4UIdJ28KoF1RHwmBZNN0AcFBDRt2FRNL5
         E/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225404; x=1739830204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTebZHS4gk5PFvDqlcXeMybwJIw7UkV3r+TMXWTUvHQ=;
        b=dxmOeBvCSH/0C627yBtn7c7eLFm+Nktqo/C8Lay3iwANnqP0ZpqqybSr3B0+O3MC0y
         TMqsAiIA2OTqfuFO89pJefXDc5J7luK5NShj0SG7i+Gp7I2Ve0Js7GHptF8HfjThHVcm
         OXu9wZTCuLFHhob7FAKF0SYVd5wkQeoiZCD1k/aisVLLfxD7vUsov/o9RzbthblanEA+
         KbCk5hjcPu06KqWxop1QeF1ekRAPVMlWgSGf/dhqYcRFUmcNQ+lvAUuMQtatNmtPGfv7
         hCVajaX2oJTmJJuBn05xFy3/CbEZqw7n6A3Sk9+XvUm48QqS+xIT6mkgLPlvzqGvMATF
         ItDQ==
X-Gm-Message-State: AOJu0YztOfht8SCbaj0uy2PLlDNmYE/goFCBPS8XxcJ/uRkD0iPa+gto
	HMcDCqM+fF8EsVArVNd1rqd61ictArhB7CS8HzHuvz5BD7fYK+pEMtMepjfE
X-Gm-Gg: ASbGncsqKE8Y9WajjPSf6kNgBfvtkL14YdiHJGPNNk39oRa3HMz02i+/IGDgtFxCjaP
	CMfq2MW+K3w9vs8T+UAEf4lT85AjX8PMHHfp3RRO760nT209ORorSvRwIV4q2V9qZ8KKKan0GKn
	4gZwFNJ2E89B7IXCRJ0HCn6JZ3ZyJlSzsKnKQt1N+1iRRcNvPzwyomEoOc84QM4ER2EfYVyfzQE
	vNuCCvd0vP5CiSOJS+x3AE0DzOEjWEFaf7g20ccoYRw5Lp5vdFLBbZBMtdQXSsPCgt4m2U2QgxU
	e8SaKMGUt9zv/gbewxx4TcUpDWwz
X-Google-Smtp-Source: AGHT+IFDQWvsMaFRnPlrYGf48iq281hise14mQ/LTGh9TT2T0tV9t8mYcQ5+AwVJvhksx+xbz2dF6Q==
X-Received: by 2002:a5d:5f91:0:b0:38d:df05:4d9 with SMTP id ffacd0b85a97d-38de41bdfb5mr1082207f8f.43.1739225404338;
        Mon, 10 Feb 2025 14:10:04 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:04 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
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
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Mon, 10 Feb 2025 23:09:42 +0100
Message-ID: <20250210220951.1248533-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
all SoCs containing ARM cores as well. This already applies to SG2002.

Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index a14cb10ff3f0..5d73d0ccc547 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sophgo SoC-based boards
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - milkv,duo-module-01-evb
+          - const: milkv,duo-module-01
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.48.1

