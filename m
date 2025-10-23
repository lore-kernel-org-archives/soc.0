Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323617A2FA
	for <soc@lists.linux.dev>; Thu, 23 Oct 2025 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761252464; cv=none; b=bUrHJHbowMo32dJgg3tXqSxGpV1E5QVZwbX/sHkBO4ZSe/tpLNxXjzTGS3NnJuG9mDc1uJ10rO3PczWGEP1fXpo9BJhHM9M5s9LvvHm1RUgJSRMItGMnoHCgAd3Vh1VQtrjhYndWT4zS29kgM3pKfVfmgS5titwiu+bxJLpWedA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761252464; c=relaxed/simple;
	bh=Q0y+6QYfTowSA4vqK/C6vw8uOX4gIsc8BCMMveDUpzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGgVEElv0M9CrWvEMIjLess3ZzPG5NA90bs1Sx8kAIXwclfs4DhJSI4eOXf5m4tNeZqt9xLcWxeP2eG8VEdo+sQpLxfYcVyILeWYzAiPPSdg88BfoKDt5UvdnG6hvOsVtc49emBIig6xkFtQmUPnRTQup0uco25mizCKHO1Vlc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sy/ZeT8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sy/ZeT8B"
Received: by smtp.kernel.org (Postfix)
	id 34C79C113D0; Thu, 23 Oct 2025 20:47:44 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30CC8C4CEE7
	for <soc@kernel.org>; Thu, 23 Oct 2025 20:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30CC8C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3652d7800a8so10670241fa.0
        for <soc@kernel.org>; Thu, 23 Oct 2025 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761252461; x=1761857261; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEk7uZCFAnf2fCrMP41kRvRzNCAghPwQmRf+38mmwD0=;
        b=sy/ZeT8BGVwDjViQZ3Ov9EnIjquqEK47I46FDlTKhgUreouYmbPv31sHdKkBykxjqm
         rKAdbFN9ZZsZqUwl70+akDWH9l9Ty0SnrvOC/jQx3Pc4bMrtmAuMu51q8y+gJJlC0Vm7
         ydeJqGqzcuPiZ/z6Fv5WZ9Zlv0+/ukoKCyAdeyyGLwtb07Iy3PmhkpzQbWTEA0XOfECh
         DxKWw6cgcWip58tS9iw4/SmEKYuN3VhWzwB1ErpnBSTsf5CbwzJPAqc+08sIh8kOrrUW
         aWsDDn9HdElkTEAlNjoIZzzsQYT76aKNzzppHEm1ByKXtYOEz0pxK/HMlNgOOhs/HQF/
         S4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252461; x=1761857261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEk7uZCFAnf2fCrMP41kRvRzNCAghPwQmRf+38mmwD0=;
        b=VEROQMTt3MMok2+RQ2hnBNmds/CODF5Zil7cjmA0ZFLRo25oXQibH20+ZvT+UeVJm+
         R3wahiOjtbN0YG6A2KWA7d6o9Y+Ksd3cA4lpvXl8OC0BNwrNEQqIIzXKFF1x8xPdDlzq
         lWpzL4L1BR00l2Zc9lZWFTlYJUNRv/NUFP4V/iukk75XY6Br7TpIXIid4lms7g15K1Wu
         cbcrb7LbcYC8RvkxLt7W60G3p8zRPMz5LtWUqI7ethy89yUNaKlr1qpGbkJFKl8nqU0b
         OedOaYomlHdUx2U88cQ+KzNIjnvq6RC6MIVg91j+HNRqwy8e69h8SsNBeTfw6XJon5YJ
         qDIA==
X-Forwarded-Encrypted: i=1; AJvYcCVN27m1FDBklfxY+NktdrrY+QjWFJS84R1OPUsl5O9jGXuvSxo9uXbhaq/l3JxQYbHdE28=@kernel.org
X-Gm-Message-State: AOJu0Yzv5Jw7zkWKTNBauXd2dhMhbHbsns6NFo0aokebjd6Xk6r8NBDA
	P/FTZX1WqUkNbuD5YfPGNjcXvXqJbM8eY1nxyFhvu15XzOwZ80Xp7Q3Lto/LfwuO6y/E7BJSEeg
	QR/p1MDc=
X-Gm-Gg: ASbGnctyagNwcA1hBUJRrQCqdCDoI8mcToSoq66afRXf0fVl7I3zuc+CO1U9migz3Ta
	ZMgg2KIC4di900g3Gz2BRviPsInSbnpATW+LpbSRoodRXtwJcLdZQHzjpOs1kLkvESjFLGOAfXl
	oPFWwYPVFUT6Q/aJg31UJPuIQxb8rsyRsPf9a9zAHU79gZMQXjC7IOhB4VtD05lAHPPEn3KgW+u
	mAFwWRe2yynHnFGAKZ/jP80WqHDjBFnlVT3pvCLudOEOXeK85Lbao+lQwmDx7lBh3kMLzif0TRP
	5amT+hu7g0LV72MBi5CkFPNC3iY+gw/bJR/N0qEi0cPfvZ8yaP1+wty11pCwNT2Kr6+97hDOHNJ
	1wUxxhwQlKad0fBeC1zSQHn61BPZfL0M2k4BxTG0U1E1YEB7YziDHJZZGPWwQrY1OKCcUAn4U8B
	CSf6jmEt+7INxPgQ3ZDECfYZdiAjsxmFk+KATWV9/gb7gA4xOW1OUB
X-Google-Smtp-Source: AGHT+IGwMXfXE5hsO4xGJFgsfpmTmf3rqNSdzlSbMAQn2rllgBG9um9BMBNyoSRoIN9+Fl8DD+8JTw==
X-Received: by 2002:a05:651c:988:b0:36d:1f0e:1be7 with SMTP id 38308e7fff4ca-37797958af5mr76613181fa.22.1761252461080;
        Thu, 23 Oct 2025 13:47:41 -0700 (PDT)
Received: from Fecusia.lan (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc34bsm6575461fa.42.2025.10.23.13.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 13:47:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: gemini: fix typos in comments
Date: Thu, 23 Oct 2025 22:47:37 +0200
Message-ID: <20251023204737.2716443-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julia Lawall <Julia.Lawall@inria.fr>

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC folks, please apply this patch directly for
non-urgent fixes.
---
 arch/arm/mach-gemini/board-dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-gemini/board-dt.c b/arch/arm/mach-gemini/board-dt.c
index fbafe7475c02..2bba617e4d54 100644
--- a/arch/arm/mach-gemini/board-dt.c
+++ b/arch/arm/mach-gemini/board-dt.c
@@ -34,7 +34,7 @@ static void gemini_idle(void)
 {
 	/*
 	 * Because of broken hardware we have to enable interrupts or the CPU
-	 * will never wakeup... Acctualy it is not very good to enable
+	 * will never wakeup... Actually it is not very good to enable
 	 * interrupts first since scheduler can miss a tick, but there is
 	 * no other way around this. Platforms that needs it for power saving
 	 * should enable it in init code, since by default it is
-- 
2.51.0

