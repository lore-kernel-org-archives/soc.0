Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA29B24500D
	for <soc@lists.linux.dev>; Thu, 13 Feb 2025 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470940; cv=none; b=jnXVvILT55InuC0wjHDrmk1SfEVtr3nXNyryte6NJ9XUFYRd7Fg3Jz3ZTKJ6+W2itwhhe6f8/0PFszlYa3IMLiFSWmAGyhxFFNgY0n8vFuN6JmgrQ5D/82e9Tnqbm8WBk5WzgUD7RspjNLoGh+modwgXXwx9a0NEYXlUQ+hLWXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470940; c=relaxed/simple;
	bh=gJc7Eh64m1cr93UEKrUYMK8tISR4Tg83dlJHpzbCplI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDpYrK0HpK48iyO50ripFcwTunpNA2bihrLji//q6Gd8wVWoy6GL8fwlVyP5BIR6YFZUk2G8hdkbmjSCN0fSqgn1407zIZW/V4V6rKYo18w4Ds8HKkFKU68bCmOk54RVhfJqvC9Hx9UdGnkR2bqNUDEWdr4UV9aEkpzRj+UQ0V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XU07WWnW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU07WWnW"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5de4c7720bcso1749062a12.0
        for <soc@lists.linux.dev>; Thu, 13 Feb 2025 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470937; x=1740075737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrgHxkjNu9X/Q1hrHUQlLJCmY0Xg+cCRCTLN/OZ/kLg=;
        b=XU07WWnWqM7waueT+hb8q2Sp1NOk9xpQslsfUx2dTFbUvGKlZLVPwjUbqEmWpVBZhZ
         vJwReg3bqjOiOlcN3IfqY1hq6sEhxv3771RzvW+d+RcheT77xHujI0vd4bzrYpKVAC1y
         q4dTFLnRKX9o5KazlntfbXsHlH1qzQ6iEGDADbzildHx9ZTeSPL9mul4Mbb9qvfBqq+Z
         T2bQ1cAfYzmObel6PvofMQ94zCIPaRyCguFRP1wPNefJqlb4S2hlplMVu2TMV94/U3jB
         zFGX23lBA2TmkOby/MFcPPYJkvOUC8Gv/9i7gnzLZzeOxPg5go0efRw8S6vMiYzoalPz
         KH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470937; x=1740075737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrgHxkjNu9X/Q1hrHUQlLJCmY0Xg+cCRCTLN/OZ/kLg=;
        b=IlxV3kHXIwTNwGfFdxgDiHxOF0R/uw20NcYiGudnTzQrqIOFh5MtihrpsZqDr916QE
         lxPFdBJ3/18JYrHSyIqqt4eBMMXUjv6CBWQrpKlzCtnqIlWIe/iDY8nM95utpCTXFg1j
         9oKSY83AwzbFZYjxZhq25bRWnmUX6xBV5tsrQTQaJpfGlWevfGWj92Tee0gCjoqLGaSw
         J+nraUC7Ql55mOBIFvNM5KxVJbxXL7DQQl57NziMDJYxNcNEg6tjqXr8hJKPar8OSkh0
         85JJA0B+8av0yJrYflg0eZGYzNfHvdOi40eCkku+IV3lh52cE3rcjzNB7nM6u2VnvvN7
         SisA==
X-Gm-Message-State: AOJu0Yx910NIO5t7SbdL/KkDv/pbmEzKRmZvYPL2axETULFiXSGq0Jis
	zfxAurmqeqDTVRr4n4gAg6UFAnEqoZB0PG/q2pJrjjUY4Al8eKYj6Xa+VKnz
X-Gm-Gg: ASbGncus/mV302g9g75Zm3i0Ol4gtTgob0x7PDlodn3bX3ilF1928thsqZ9ipuQfO7g
	1Kl7MPwNSQEezc67T5eGMTcS05zN2qWO8RSVglVQuGawJWJBK3PxibV6d4Dj548f6WLQwSN5fO3
	AFXYRM5M+LGapEVuNAkFy6zCyIr317xURNoyOl79fZQRCe/bhpvrZO1F5j3EIZZejTg1nZcoR1i
	ClLZjSUcfiMyDRQTu4V9xO5mXQOjtWVXxWGv7R2eV2eUv5ZfGICvB60BzXWLhF1+VvvLlEnRlxU
	uR49INaq0jUyrJ3gDtZNZUS7Bc0A
X-Google-Smtp-Source: AGHT+IH/Yi/EFpYPwVBoMo0zkp4iN2ezmFezqDq4NFl+9G7EivdIfhPrP4/hFUgDkeiAuMIpUimZSw==
X-Received: by 2002:a05:6402:358c:b0:5db:f5bc:f696 with SMTP id 4fb4d7f45d1cf-5deadd751bdmr7502320a12.5.1739470937100;
        Thu, 13 Feb 2025 10:22:17 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:16 -0800 (PST)
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
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Thu, 13 Feb 2025 19:22:03 +0100
Message-ID: <20250213182210.2098718-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
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

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
v3:
v2:
- patch introduced

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

