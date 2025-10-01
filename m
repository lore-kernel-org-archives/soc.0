Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0352D7DEA
	for <soc@lists.linux.dev>; Wed,  1 Oct 2025 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299070; cv=none; b=nz0OmlBaCXTyROX8qPFV+fq0yIWG0dy+D4Rq9YItrkc2EvLQ6ht7AA7Idj2sfgrq/oBjB2pM3ryeR53iFwlstTu79h3dc76blY3sQqrggk5EHwn46brLuuxya3Jk1MNdaIrbpXW33QXXHXnV4wPNPtKlnBS/LQqChSTfTvo/G7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299070; c=relaxed/simple;
	bh=EnMvwwcVnn4TR9RpXMxPSjIROLC6UEQq2D9lZIwgbXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eHbBeM1IBblhTKs7mXmESbJeSjuPZ0kNL7jpgrC+7mfItIq9MuhQTxby4GrXFuHCZ4jvlnhxJss1QN4c0j98Ydrag7sCru4sFA+dYUHdoDXG1mnmPULbhNOBpSgblFnXnZWN+vMwqCK2eHJhjcBIoM+mly07TM+hEgKP1nhJgtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WU6V4wgz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WU6V4wgz"
Received: by smtp.kernel.org (Postfix)
	id E3F74C19421; Wed,  1 Oct 2025 06:11:08 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52BD7C16AAE
	for <soc@kernel.org>; Wed,  1 Oct 2025 06:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52BD7C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso7091590e87.0
        for <soc@kernel.org>; Tue, 30 Sep 2025 23:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299064; x=1759903864; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPbUyi3Q3nq8aPmPA0ZDBlB+APZ2KXXf6wjKaFOxmBM=;
        b=WU6V4wgzb6qWinnsyGDb86yVcB2EKdBodJ6PGzboko9KlRm7Kv6XnpDVUz2Oj0TP+3
         BMnY/yo2J11neDDK6G6TFjrvzmvlHTr75Fkx/gATi4Wf8Y7NmBKn5Rfk1dS+FeIEuOcB
         f0ZpurLOdNLdcixEaGQLQZDXfeogQWyPj6jiRYf1NPdAe8w9kvv9IFTibATUaT9X4yoh
         WAK76gFBI7NArwXFxgH/DJ70pWtsTP5ytv4HQ5SlgNNVEt9aaSYRWurrdo99iT8qy7VC
         pBOq93ZqPqHdVYqzvhzKL98a1XtzlLQAiAEfAI6iBsxpLpLJFGGJBzVAYCBSo6OfMZEv
         vFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299064; x=1759903864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPbUyi3Q3nq8aPmPA0ZDBlB+APZ2KXXf6wjKaFOxmBM=;
        b=WmY8oRxAhxIlncU5D8a7gzeiDzgRYZEbChQJ5p76SG1YYPoRwM2OMDnsJT+ahn9rVO
         kJij0V2ewspRJW05CeaJsObgQTJW6l5cFnjpvJZyEL8KC7R3vpBW+E2LFeBlzyy8Dt7j
         3dT4KN9oXMhHHuzRpJ8Md2HC+094Ti58IANR9xvU40oqcpH3CDBW+TfvU2YR9oSd5mBq
         wYkcAvkx0lVrSt0V1yqZU+pUbT3wMz+UN7+H9P4Kc6euK220LmeU3ScBy3S3N/9IEHTP
         3xzvUjwBEyipB1aXZb2psh0Y0Oq5TBWQzwbD+GvjebqZZ6vciqgqES34wf6km+umcI9P
         18Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWIhnS2wt3PikeAcpdwTG+tYErHu0as83nH+Pe8vZdrKivZet4qbYJjutjJD7thvaBrtEM=@kernel.org
X-Gm-Message-State: AOJu0Yz9PnZzvx+RNlMsUpewFZh25nAxSqDOf+D3pQqqPX/A5HPAmaNi
	5Kv/6jv84QpPNXq8Yx3KgtA0vijcoXU+HZpcT0k6di8sXCT5D8Z1qlynxQMhGvdmUq8=
X-Gm-Gg: ASbGncu8umd2LDkIzXTp2vEL8Srj+xGfyjz2luNOx7teFVSN64Vq+JwYh1dLc7oDh6P
	q1viPn4VuG6PQb03hfn5iOiHNrOtjDB4vkE34ibE6qEILl0pD8LPc1jb0I0LPtozPAy3C0RnABC
	6U09WieJ9JZHfSVKlp1dHV9kWAhIfcqr3aa46jN/oNGrSqe4CA98ZqxTa+F/J6Xp+MQHdbRn8t7
	qAWb0ECAkAYVi25Mn6UOOPOQVTAsqycfhaZLBJ9NegnfBkVvyPaeHHXAjx3n7rOly3D7Rmf+bMR
	q0xQDcSFGF6A3pr515ntKsW2z4XKKly4Uc5BRdYA+QE4Fl0WR8GGfcLqXfyiRFsYMYK41MtMu0S
	wxBTCG+aoaxkYjCWLZWbo4AHu/RfSXF+SEjZO4BG+v/DAVQgE
X-Google-Smtp-Source: AGHT+IGb9ywHHlzO/N5tYvmZ6pYH+F27XDf42oZw/2wC3QwlBrNCQNAD/c4bdpnGO5yInEix5KS6tQ==
X-Received: by 2002:a05:6512:ea7:b0:55f:4b01:30ab with SMTP id 2adb3069b0e04-58af9dcee09mr665163e87.0.1759299063818;
        Tue, 30 Sep 2025 23:11:03 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm3984553e87.43.2025.09.30.23.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 23:11:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Brian Masney <bmasney@redhat.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: versatile: clock: convert from round_rate() to determine_rate()
Date: Wed,  1 Oct 2025 08:11:00 +0200
Message-ID: <20251001061100.372737-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brian Masney <bmasney@redhat.com>

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this patch directly.
---
 arch/arm/mach-versatile/spc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
index 790092734cf6..812db32448fc 100644
--- a/arch/arm/mach-versatile/spc.c
+++ b/arch/arm/mach-versatile/spc.c
@@ -497,12 +497,13 @@ static unsigned long spc_recalc_rate(struct clk_hw *hw,
 	return freq * 1000;
 }
 
-static long spc_round_rate(struct clk_hw *hw, unsigned long drate,
-		unsigned long *parent_rate)
+static int spc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_spc *spc = to_clk_spc(hw);
 
-	return ve_spc_round_performance(spc->cluster, drate);
+	req->rate = ve_spc_round_performance(spc->cluster, req->rate);
+
+	return 0;
 }
 
 static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -515,7 +516,7 @@ static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static struct clk_ops clk_spc_ops = {
 	.recalc_rate = spc_recalc_rate,
-	.round_rate = spc_round_rate,
+	.determine_rate = spc_determine_rate,
 	.set_rate = spc_set_rate,
 };
 
-- 
2.51.0

