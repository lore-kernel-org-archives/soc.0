Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC132E5B0E
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763494017; cv=none; b=mUxVbgYdEp6lb2oa+e+cMBX136YaepLOZGHVzpf9M6NiLwia94DfZA9dMK4GbnlFs6hsEaGMi1A/CQn/fhDDKkPuhUvi6xTWi3WO1fdxVPtI9aNoF9irFR+QAd1oS3tMO/paobAHS+c6TVdDEUMdFPJL1QKJUJ9LNtMxfp1VO+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763494017; c=relaxed/simple;
	bh=wtjjMF6gX8LoU0KrWwFexq4P9KObx9LF4JCfTTDRPOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNdx3o6tUQJ0/kqbuElK+0tJsm3ZnSZXV9b8X7cye2b9zZ/E5s/83w7O2v15vy7ZdJuCJluPsaIVDYT+esy7ikCy6+oPuMVUBTxLa6CB3CAZDQiEtdjh046poVQc6gBGbbQBRIBaIva9GZCyVdl1qaXb72JblqWdeDrW/Kdj7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e8/r/gEB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e8/r/gEB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29516a36affso70746585ad.3
        for <soc@lists.linux.dev>; Tue, 18 Nov 2025 11:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763494013; x=1764098813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMCJv7gIjyTFsunTp3pUnn1ruCsV69MzBggFz3aEXIU=;
        b=e8/r/gEBxEHo/Y9d/H1Y40+aEEPR209Vm09ZRpWNjkev3oPbUESl8IfK0DEjK6D//6
         Wv4SjBECW7/H/cuna67zhMlWC9VJrWYV6IoUC7iR5vBvV06gwuLpIpYejCk1NSY+BREh
         8lNrZV/ZxAtxCoP0mCz+xoG1sTpImYUtDcdMBrp0gtT21dJjhqzbsva5ANGxAIHRKc31
         8pkiDPX/Fozltgrfg6++Wvg+y32ci8vA3zTDNiyB1ymCGWnSC/qLi3UFZQFKFjUnQTiH
         6BtSpmHPC1ZMGh4Gfu28/oZSLSW3uQuA3Yds4RGqO4VjAQVj6xIfNUe5auW3sH2EEBgb
         d4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763494013; x=1764098813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMCJv7gIjyTFsunTp3pUnn1ruCsV69MzBggFz3aEXIU=;
        b=UPxQOjHnJzJ4m7FBfi1/AO2NcioKU+U29exCpAkxx+wLNIqACV/3743lJe+zAhWSeh
         SvmxmeWDIDD14zrsRbgLbxSK8Q52OkFYdtyf6enTI8v0nD0nMuJRMAQFhwgCpeWYPy1y
         FpN8oj4jZs4mdHhGRx/wP3Z3/A5Tiw2IePHMy99ceUkalRDdzA7WFY4jGhGLPMfsvNuc
         CGyWZ1ETu5DMjmluqLrWZ185T+OL6iXJh20nybBp8rNc8phqpW8baGpwiXGUt3/Ye5H9
         Ea79VDHf4zQiLsLO4syDr2A7PQ6rBECA9EY/UojL+ViSsn/xU/6LOpqoXtuB85Y93mm+
         OQ4w==
X-Gm-Message-State: AOJu0YyRd3f3okOns5ozmI7JCwa2ufoCaSLeATCn9237Ry/zi1lA6oOu
	JlfcEplAqqDRr5/c50hcLtyPczjQnohr+4D1VFMqpSJa2JMLRW9RzksaDGjLP00jRIHmqoSPQqY
	/21zoPGI=
X-Gm-Gg: ASbGncsSjg1372Z21MWBKwjDaANP62RRb+LQm+RmG4jjyZU0jI+IvqzNkL9pHkwRlzn
	9f7OzuR5py6apk7M9WkopU7JrlMgvSgkSebxZV4QYYGMeCPLKtp+5kJleRaZyGeIKxJaSJii9EG
	IxUc7/iptjjjCUPqn9PrQZIgeglLrp6hsWhKKCBVsSJa7kvWqHaYSNx1t5ayDNDqH821GlsaVWi
	8XqfO87dyG60T6lNRcdtipC2aH2XaOR4T4a2QOE1/gk/r3RvBTx55UONK1tgmx+RJoZkmXzH9LJ
	ziYWW3GvpEJ3Pmpe7fW4WzYIgdhW7w+zJ07Xzd2IloGDqU/2q5g1vo8sTTSm/PFDOV8x6jHjJbc
	pfWb0m0SHsC68Fywbct0cx05o2SCb8kSPKMJlrU+Z1Fe1yU/UvWuJSHVImZ1DpvrAahDAUFg3zC
	Y6DXzGNP6a
X-Google-Smtp-Source: AGHT+IH+1MfKhMZYVCHlB0z3H1up8m/vKg6PMYoRJcXNLAR+G9arTuBQ15WRuSY8+0nPDLp1Qg0xfA==
X-Received: by 2002:a17:90b:1a8a:b0:341:69e3:785a with SMTP id 98e67ed59e1d1-343f9fdf8efmr22663351a91.16.1763494013323;
        Tue, 18 Nov 2025 11:26:53 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bc260027sm229481a91.13.2025.11.18.11.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:26:52 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: SoC Maintainers <soc@lists.linux.dev>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Tony Lindgren <tony@atomide.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap platform
Date: Tue, 18 Nov 2025 11:26:52 -0800
Message-ID: <20251118192652.316198-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Kemnade <andreas@kemnade.info>

Both used to go through Tony's branches, so lets keep things together.
This was missed at the time when Co-Maintainers were added.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Acked-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
Acked-by: Kevin Hilman <khilman@baylibre.com>
Link: https://patch.msgid.link/20240915195321.1071967-1-andreas@kemnade.info
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Arnd, this one fell through the cracks.  Since I already sent PRs for
v6.19, could you apply this one directly to your maintainers branch?

 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56014e422312..4bae9956712c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18751,6 +18751,10 @@ S:	Maintained
 F:	arch/arm/*omap*/*clock*
 
 OMAP DEVICE TREE SUPPORT
+M:	Aaro Koskinen <aaro.koskinen@iki.fi>
+M:	Andreas Kemnade <andreas@kemnade.info>
+M:	Kevin Hilman <khilman@baylibre.com>
+M:	Roger Quadros <rogerq@kernel.org>
 M:	Tony Lindgren <tony@atomide.com>
 L:	linux-omap@vger.kernel.org
 L:	devicetree@vger.kernel.org
-- 
2.51.0

