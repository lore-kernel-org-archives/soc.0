Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24AA202F7E
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400240; cv=none; b=krUu//7p8ZvOoBfhGVB4S1i234yL+hDPgkZJ+dOoQmy7cpoZN2OWm99EPGnqkQifK7kHFWoWgp/pYDzVg3DdxMYGvgZoaiQs4y38hslnD60wW+KA1Yh0MqYxD1oyrWF5lBWvUE64qtgEWFPGR86SrfIYZfNNgN7ldaP2hHlTdmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400240; c=relaxed/simple;
	bh=6kwgRI/FlgXZhVdKkCbXIvcA7IIE4FmKk8xsnIfMDuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZXPJUjAWrcMSj0wdhDSfFRzfZO7WXxMDQ4KyggiaVv5oNpTn5TyFF6JQVGrok1K602veFrsf5IpFJ2wIdbl0XMzcy5b420gCsQD3iq29qjhYUfUo3jvqPvPVppBFQq2t3bwCXBErhJN8rZIkPwR4NTXqWQAQolcWrsIXC5hDq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7i5Zs/M; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7i5Zs/M"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so443233a12.1
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400237; x=1740005037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZXh53n6VCDql3hZOCr9qqqfbnvH47zg00k2fG55aMs=;
        b=e7i5Zs/MkbmhmsHlKSA5gHloBO7EK0ukI3C1r0GHS7InxieA4+0P9utVV3Le0LtnYM
         GSYfP7i8JBU7ODxZF1JBpg1rNnCJPNplJbuxvJv/zmdCW9KvZYzKT6bmOg9HqGqdtys2
         vyZFQ4Wg4S+/RZN1tBRVgSjXprqZIZ0pyHOoTDMUG93p3vWcChGJZqFPUD3tT5/dVOfu
         zntp/ad8MKlYEKm9Km4F0THICWor1G8XFeq7VJao7SEescFEMyz1DP8JBk1jXnV6PVSA
         ml9UT1Aeumo6cBEBOGDlvjWZ/IJrIDCiNLkgSM+IBJ9hA+IIrOFVU0hCu/QVGCMoNZw1
         /RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400237; x=1740005037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZXh53n6VCDql3hZOCr9qqqfbnvH47zg00k2fG55aMs=;
        b=Djaw96s3r8gbGc5a0jbfkTW+ZV5slnJ+L2QxpK8J3iZK7qv4cR6nG8+7sxh5SLtXCX
         p5zEn03aNPAz1u4Fja3PjsQ3F60brgWfywTuEbwVFOeQITD3BQgra+mFg7Q8CWmxF8w6
         V+s+rQeutdU523PaYVJewpVGHeNC3Qm+7dPAf2bSazCaY4S5O5WgWlStj0MX05D0uEop
         KH7AwfcTKr8R+0HNo9gjU4NA85a3ck2Yf081akl+A2NrauybKMGWNFor8GGj7hqy/OWE
         pWjA+i4/LPir4L0k6SwT+M4T7vIJuu6Ocr/2xKwXFXiS0+N/scXYqbq/eOwl4lAD7Am0
         pvyg==
X-Gm-Message-State: AOJu0YzBUIqBfeayHTfNkN77Ncjh/6AWJnAQ78o/eRRRTYCqxscLRPjO
	g0Vmj4YKhji2erDil+prqYQMBnmFQ64AODG1aE0qMP3c0eoI6CjfF/onh01K
X-Gm-Gg: ASbGnctKuOlYxUv9BoOrZ016fOgSrpVGxAJFmRVw+so64uYC793fmnajhOxt9Yehlzn
	0Dj3dIzLfvzYXhy6TTYpiafR8SImpLzc2d5CNYUNHzPw8HcuDJKTQDO0tCf1tWnPhspDO/RaopP
	jqwkhvYkBMCpjoty3JF5ngJrgWl+L7mco05E5m2dBs4YTK1WAVdm/DHWGblYclwqPatrysamMjr
	WQzg3sYTdVkHmNS182GqhMHh1oUJGfUajvbb6kY9e/k2IiBCnGA8UAwPnCGnKVqQqNNk9stbfZ0
	uPCAh26u7bvjwj9ctvK/dzQLMft9
X-Google-Smtp-Source: AGHT+IHBmtagS8Rywtty3nyKWJ5uTo4mUVNCLeloZZ6MDa1HOxfnWgqxmhF80EhBNTH3MA3wmgnX/Q==
X-Received: by 2002:a05:6402:4316:b0:5d9:f0d8:22d5 with SMTP id 4fb4d7f45d1cf-5decba8f0d0mr438452a12.13.1739400236755;
        Wed, 12 Feb 2025 14:43:56 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:56 -0800 (PST)
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
Subject: [PATCH v3 2/7] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Wed, 12 Feb 2025 23:43:34 +0100
Message-ID: <20250212224347.1767819-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
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

