Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B322B8BF
	for <soc@lists.linux.dev>; Mon, 10 Mar 2025 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741616127; cv=none; b=abRGwcMhsgmQKLoDXoy0dKl0KZ03teLA6hDrHSHC1l4ax+hdsg6B2E0i7W1Pv0v+HyscDq+eYo6VRN9rucNMBR27VwWvJtG0gaH98L8MC2MUBb7Ta6Rk1yGeoKNos6aJh81A6UjnnKX/uQ7U/n6Odz/zsy/lfDrqFx6rAr21vfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741616127; c=relaxed/simple;
	bh=R5cYze330EEhV9HjxbohJG02MO4gppXi539KLPKQZDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDpaiftI22CAk32anxtD+F1uvrQ9fYziHh9eJKE0yPMInhB6k67s3Z5D5M827pxIchz8zK8RHj4hj+kxDsP6O4qZuixktQ9IKthkUPO+yTFpjQg5Fg+VBN68bFreTlbT+rDhmFFj7ZzwzRDfjExvDvi66ISRliNl4bSlS0OPK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTqMEFZC; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTqMEFZC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso887463a12.1
        for <soc@lists.linux.dev>; Mon, 10 Mar 2025 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741616124; x=1742220924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8kBRWc5jt3OVHnBDzrMkyd1LbW4R5VTX9YwMKj06nA=;
        b=mTqMEFZCIYLxcxxoLMb9OeMOT5ifYsMAYSxMs0/IikeUsxrcfNjjFVYdNwCY0+XXrc
         lqV/yRNpQLZKIsHBLG+HkdfmLzfeWefPkNRs/ja4wTgZkeFJoXakBQCNzBnYw5UBhnf4
         tn8XBRRkYvR8zitEJdr0si1YQ3Hoefn/7GJkz7OPWSaxOOsIsLVAexwTqRXMtn0HZ7M1
         /UymKGucOKEG7Y8eah5EfXx0kM/hq3ogNat4t5iqHaEhcdsG5A9drYVOIJWPu5rT5/3j
         avxiERAceEajGJfVeETEYJB7tHfvNvyKzo7S/XYepg9RGhdQFvddNIfV6OK5fb2qHh+W
         lkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616124; x=1742220924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8kBRWc5jt3OVHnBDzrMkyd1LbW4R5VTX9YwMKj06nA=;
        b=gwCP7btD1I+Lnm64ZKl0eIE/TXvV83KdwmgYt9+eFxnBN2PZyb6pzalnv1iUIJ9giL
         Pw/Y43YoWhjxioY8nQan2iVYbjsVG3RZ6ZlnP9xNWqUGfQemBSvlr7lIpMMlUCV91nKJ
         CJ49fjAJ+CK0jtKmvlx/fstDizaZM8R8ww1+b/V11jWVwP2B0uShSzfAMOsGz0Emy7Zo
         LeNMqJp/iyEXXSZQHiopqCoZSnOr4B6B8sWz6Zfs/SUFuNzUZ35TB3bsl/vH/i8IlHTc
         ZhwNVE6uIfTyAK9UxlGhhny1bZOAn1njSm+MPT673GYD2flHhzn/j9Yzlsfs4XMfFmbR
         gGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqzR/+Bh+6YwH4MpNwggRcJpzbpYRdbxLpqIb8hk3c0oK5OahR/1Ek5g1A3OJmH1gaxww=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTGlTD3KgpWB4ltRA13wsDpFKgudo/6KWs/Aq5SfruKilKhcBk
	/jG3wORBFDBxYtHhoEuuoRpe2HW5yTo/qcXDD42aPKmkTeLBZS/0wBPzvd15O00=
X-Gm-Gg: ASbGncvrHT6bQuIpU90A82sjs/ly5hVdo7o5E5ZTsHRhne73OOq9Q7Jo+13BURIyGeN
	8zNW/W/B8gOKlNKtHTDhYkqOZMjjPWwNagfGXzoV1yyr/0srtU6kOohVKxVD3AppNJg6TspnlvV
	QJf5kUbP5zYlsZDKjgs/qRgEVqNaE83fiKYq/fc+yjqDjO0XKmrgvfxksI641uLwQW83W6/zBpK
	P2C4YhqmrIYNVaj2LYYDr3h18X0Zt9bjngNnhqsCswW7q+Hv7zROA4y56Er64oXtVETE0CCmqSh
	vvIZIaowZdUbit07SUqvTFrDcH85Z70Dx4FyViyhveSY0SwBGTdYXVOlWXg=
X-Google-Smtp-Source: AGHT+IHi5JCpBTcbsbhT2I/hseGBFfyR7yoJdDcDWYxj6SyXVAAOx3q5KFpDFnesjEe+n1eMkwDjYw==
X-Received: by 2002:a05:6402:2787:b0:5e5:cc29:a407 with SMTP id 4fb4d7f45d1cf-5e6180bf78amr3474200a12.8.1741616124122;
        Mon, 10 Mar 2025 07:15:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a9315sm6981925a12.46.2025.03.10.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:15:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH][GIT PULL fixes] memory: omap-gpmc: drop no compatible check
Date: Mon, 10 Mar 2025 15:15:14 +0100
Message-ID: <20250310141514.56033-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roger Quadros <rogerq@kernel.org>

We are no longer depending on legacy device trees so
drop the no compatible check for NAND and OneNAND
nodes.

Suggested-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Link: https://lore.kernel.org/r/20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Hi Arnd,

One patch for current cycle (fixes), because of_property_read_bool()
will generate warnings in v6.14 reading non-bool properties.

BR,
Krzysztof


 drivers/memory/omap-gpmc.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index e2a75a52563f..53f1888cc84f 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2226,26 +2226,6 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 		goto err;
 	}
 
-	if (of_node_name_eq(child, "nand")) {
-		/* Warn about older DT blobs with no compatible property */
-		if (!of_property_read_bool(child, "compatible")) {
-			dev_warn(&pdev->dev,
-				 "Incompatible NAND node: missing compatible");
-			ret = -EINVAL;
-			goto err;
-		}
-	}
-
-	if (of_node_name_eq(child, "onenand")) {
-		/* Warn about older DT blobs with no compatible property */
-		if (!of_property_read_bool(child, "compatible")) {
-			dev_warn(&pdev->dev,
-				 "Incompatible OneNAND node: missing compatible");
-			ret = -EINVAL;
-			goto err;
-		}
-	}
-
 	if (of_match_node(omap_nand_ids, child)) {
 		/* NAND specific setup */
 		val = 8;
-- 
2.43.0

