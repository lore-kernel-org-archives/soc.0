Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1820C477
	for <soc@lists.linux.dev>; Sun, 18 Jan 2026 08:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723397; cv=none; b=aggtUAk/u6mx37+bcARR75H1qb/aeK8A3/x83O16tTg5cZnP3uAYqSW3gNRw1QBzUUzdnsROjteF5OhzrQCp2+BbDQqEC6x/7Wh5FZf+7ahbshzsgWK6PXb34zydxjBtUylRtRG/QgkNt0UuI8kN6SnT8v/E391M3tnZRbwdq4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723397; c=relaxed/simple;
	bh=iNlyouCX4ztJ5uR+HLG7R9Ms7Gtp53ClA4DmyyIUaH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bu6r8t9oiV0iq4/O3YWDY5Ntqmyk8LzZvoZUQHCsxfDF92IiyS0zqL52brV97kLrT0Pgq3GA/CYYrSSq9peSXEodi16Ui9ll6S39O0D2dV0BwClUkOoLrg2PXfiJAoFPLwUtywVyI8Z0vCSbsPbD3t3OAwhffqkeRqE8DRVI3jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV91APRA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV91APRA"
Received: by smtp.kernel.org (Postfix)
	id C6FA8C19421; Sun, 18 Jan 2026 08:03:16 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0DEB7C19424
	for <soc@kernel.org>; Sun, 18 Jan 2026 08:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0DEB7C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ad70765db9so3146977eec.1
        for <soc@kernel.org>; Sun, 18 Jan 2026 00:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723394; x=1769328194; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sRCewco8tgHw4XXcafKVb3dqNsijWHex/AmSsnm9Nw=;
        b=JV91APRAiRnZn+TrxHVD5sv2tfLvmD6wH8qtOillOJIX0FtHP508CYjFl8JBL175Tl
         4mCUdMdJQ7yVILBKF0/UVdrv62KSXPkycNoyzISybFqAJG5dsjzW3lEmRLpdrTpdKPbg
         5qfFxQwsvh+mSXdEAfwlSEFaSNIpXa9YKCRLDhBdO4KEtTZ3N2SdJEUnHl4Pt348y8tr
         Qdfp4HWn/b4W+jj8I+w9DaRvj+Zx9v8C2PXOIVVJfVHYx/V5OL+68YM5Nj5r9dZwB2In
         TlbBZkygZm/JacakK8skMoxLSs8E3yCTdpmzAlgzYxy1UMcm8UL/cDrJYNCvoqj5nKNO
         yYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723394; x=1769328194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sRCewco8tgHw4XXcafKVb3dqNsijWHex/AmSsnm9Nw=;
        b=CgixjnjJMG1NC/GXw0SeN7fR5B2A6CnUe5LC2PrcMvL4od1EWo92IFD7CP+EVsTU6x
         f1OztSH4ZrRw+Ei55MsZPbszWsxX6sXzpHsclxXhn4ttc9cfgMaAzDgpnUJaLdbrRO2x
         idLT4n144YalECddO+5ME+DKGqc5alWxO8o1yNqqNfVuZ/qqwRyshl7Isg0TAZkaXaHo
         /GW2e7TjNCmsjyl+cF6erRrlvlrtkmrgsOUdUCvUI0UmJwT5+7S2khcMR6kNWDgLKEuz
         cIijk14fiONO5eVq400MPjjvPb++uU/FLgeNbftO9PU1Z1D2L2q+IPeJOGoK4SMcg17R
         H1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUooxzXKtwoQFsqBJtXDAqRv60oDO0WEbFvyQaWT41QWF9utIZZFSjO4H8fa2F5eus2vFs=@kernel.org
X-Gm-Message-State: AOJu0Yw7q2UP0rSEH2bgiGqgjbpTLNjLSdPSleHNysLGJpSm3cA/EaD1
	c6WE14w+PXjAaa/IFeGpoYTC252u7TULAZZ3sRlmfS3CkbroH+2s2FV5
X-Gm-Gg: AY/fxX6UpSHeAx8PakSRn3R4TuD8M7aFX6LP7b/r9ylSIyTAyGoftEycfKI7Q8ejC6R
	sXMriroXffgpkjehcV/UZvq45d8TDAp5qsq6hsgixtq/rfGByYjAPZAnvrX3fH91GJd5o3feKhY
	4KtS2Bh7Wa+nBYi7pS70oyR3EfdSaYYZEB8pfxqH3d7ztmPbqTf79NxDzyoWxGtuu4dKu5SBxqo
	Ut2dBj2pJNSaOoVvLdvIsDu1IQGejVHQmfESjXmJct9Vf7+2W+Zqdo8gbzkyBafwC45yQygs+vF
	iF94P+4hqKnjn9zszMoen2h6q/bJVq7zR1IZNMrg49BPOdmsIEhlDFBsaW9SVhZYvD6+xebgaYR
	a6I5fBv7uyAYBy4VvJVNoEJb6D3yWaecxr5ZmeZVyMCmsDIMtVeMNmCFGC6SJTyaRIsZPmVCD5Q
	6jmAZpKF05+8JsriEeCsxhRaTswfCbKrhkKgA06exib8jjWhvzshTlL8OVzPQebblruqqJNrRtF
	H4+3JTIyMqKow8rYw==
X-Received: by 2002:a05:7300:c86:b0:2ae:5275:6901 with SMTP id 5a478bee46e88-2b6b503d29emr6365433eec.34.1768723393925;
        Sun, 18 Jan 2026 00:03:13 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3696f40sm8460212eec.35.2026.01.18.00.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:13 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] ARM: tegra: Device tree changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:02 +0100
Message-ID: <20260118080304.2646387-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-arm-dt

for you to fetch changes up to 4d93678236678c4b6b0076fd11f4611a22b7e70b:

  ARM: tegra: Adjust DSI nodes for Tegra20/Tegra30 (2026-01-17 01:18:38 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.20-rc1

This update corrects the DSI Device Tree nodes for Tegra20 and Tegra30
by adding missing properties (nvidia,mipi-calibrate and cell
definitions) to ensure proper MIPI calibration support.

----------------------------------------------------------------
Svyatoslav Ryhel (1):
      ARM: tegra: Adjust DSI nodes for Tegra20/Tegra30

 arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)
