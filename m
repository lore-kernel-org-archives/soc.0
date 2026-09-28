Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2464E3EF6
	for <soc@lists.linux.dev>; Mon, 28 Sep 2026 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616989; cv=none; b=cASiCoJ6H5SX1P4hIvbCoYABOBq7osRnNvnTaaZ53kk7f2SLoUd9Q/kFubpBbIso1dAOI/olXSuGdhcZ9fnVcmwgFzWsX1iEs3+y0cljiikn9ag5VShqtM3iAjkLXPLqW5ed4tYnMEyO3IATVb80zvyPdLkmXZwD3Au6OuKhoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616989; c=relaxed/simple;
	bh=bvv2oS4oIBucXPP7+zG21vJ1hRwRJThPHQGWsxYyRG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bqY6wfu2c5mQFVH7i1GbXlvNR2yGSOFxNMiPwJWiFtpibGX2IxYBorUtE8KqJpeETmB6sMmK6He+qC7PgCAqp5huLHL9fk9U4PEfC+820xPEvKauGCJTCE5bdiRCffGnyIMcO+yoU0aFnIxQ2ZNFuf48ymZmilbU+6JA1bOngLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=R+SR8bt8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="R+SR8bt8"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so1244941a12.1
        for <soc@lists.linux.dev>; Mon, 28 Sep 2026 10:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790616985; x=1791221785; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QcMM/70ueq1BvxYllSAMCDlH687AiK6lQ79IdX64Iy4=;
        b=R+SR8bt8Xc8G+WXnXlTcwPWKx0KH7H8ECqxPGceN8BYk7QmYnwwx6RS4bd3SotkKDw
         s+XnbKgxwudRcSWDe+4e86UXAYoK4ypDy6pT+hqYgYeOft8PmOPDqgAudhV6YCs/rxZf
         v86FnRROTVzHToza14VevYpDSss02WjhYN0hximi44jJqTEBBc5hAem2Mu8HNwCQ+DX6
         TY8ppoNoV6uyukGpurLVr6roVgpg53iqhLLMsQOdcAIYVQMbj+Ns+g9E0fzPQgxgsqDu
         4/xnjAunv1X6eVD7cin+Pzwe4/er6i4KxeN/b2RDnO0s5gCi7KMgD9LPc6s+ZeeeUyed
         7kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616985; x=1791221785;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QcMM/70ueq1BvxYllSAMCDlH687AiK6lQ79IdX64Iy4=;
        b=aQ+k3uK5z6+OHDOscEJbKw8oxVBhXaAIoOXPUNIwWoZF/EslSkZcpwh3BuUg+yrCkg
         z7RUKG3SEohEIrOKP0XIQE6iOfY2alzOO0S/DCVskyfMw9LBNMfK+hDJA2urQV/IfK0W
         JBSBw2lzszun4FiB31gT4p5Sg9fdvaPm3NmGDlD7o24fwcWTkgZZPaiUUCltBMAsQbh5
         6xGuitRAkl+HjtAH42zwa8BahajocmA4zCI8n+CquxX3LaRx3QKtw0svdgeiwQQSWwZI
         CMHsW/BfoNXpX69lGWq6ueQFvD/9XpbV/seuM9UBW+0NxIdfBvEDE2Rg+OzU/ZUPzL4/
         w5jQ==
X-Gm-Message-State: AFq9FYL9DlUuco/UyehUP5jj2OW4JpkBMH8j82ba2qopbILCcWAMG+Fn
	HN9I4XXA+EHcrcsHo5RuefTR/MiX+tIBaod7/f0PWk+1nXQpPqMmHKkXar+Hx8GnYjwkjard1ng
	jYu2U
X-Gm-Gg: AYBFou2irkhcDZZZQ7QmcABwlRY5uBp4KiQsQVnsAWkRZ0ZbDoO75NiNI2D4XwpqT4s
	qADnvp3Ari/08JmHYr92k7DT40ItLRH151+Zj+PO6v4ZAr/6PZCkoAmBHibHdBWDoFZvVkDYIn4
	YuWmvQUkCpAqpkbwSuYhPxt1mo7e5UUXdCP44jqGvrMlHI94LjaQQVp0W4zESfj8y/SkOWoFVgy
	LKJmLHkx2AQCiNQW4hP3VtPJFBu8hDm08+x5DhAP0QmPKxEX21wRK7yRtjsK8+vbxKTAUhUm1F3
	2RuUKwNydOqfE26+7oweStmII4EEAeWc94ytHZUnqdRpGGJRMYILgin/OXLhcIztRfM2fik4Qvq
	KY2NfyZDyXF7u2ITlZ84qigAuMzYRvryBO2Y99rqasKJaYGTLKQ0WeMRh9BirSmv9mFsAl9nVM6
	X/L9qRWAt+ldXF3DnB3OZliGwnXprtNziQ2tjZ5jJCDKImMEnE4SjUSaMGZtsEHxyvvvw=
X-Received: by 2002:a17:90b:4cc4:b0:3a0:ace4:d2a9 with SMTP id 98e67ed59e1d1-3a0ace4d746mr9210271a91.64.1790616985559;
        Mon, 28 Sep 2026 10:36:25 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2df91409040sm46157205ad.41.2026.09.28.10.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:36:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP fixes for v7.3-rc
Date: Mon, 28 Sep 2026 10:36:24 -0700
Message-ID: <7hecedb7mv.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/fixes-signed

for you to fetch changes up to 2fabd2f406d0cf787be47b3bbeea99b30004033d:

  ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition (2026-08-31 09:54:09 -0700)

----------------------------------------------------------------
ARM: dts: OMAP fixes for v7.3-rc
- ti/omap: dra7: fix PCIe PHY clock divider definition

----------------------------------------------------------------
David Oberhollenzer (1):
      ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition

 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
