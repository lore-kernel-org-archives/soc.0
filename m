Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72DA23FC41
	for <soc@lists.linux.dev>; Sun, 14 Sep 2025 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831975; cv=none; b=b3OLDCIUpaqTmUD8CAwOuq+ILf8uYqYcRiwMfi0LR9L1ehqFPO5CW1ZZvpi6B4ONQa18onpKcGRq1JruMaLiLLzBVvDP0drtGrzLDCqMnxk5Yb95aSWJfrz94R3rkEZEOdZPIeaDtdxnLHldlpvK5zI67ch22fmtjMq3gBsxeM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831975; c=relaxed/simple;
	bh=3yS91SafP5gs+0t5759+8H93GU9bqOUQXbyyno654MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tRCTNbSEk0tljTzebpwJdkA7hPsC2FQLVoP+e9oLKx3w+SuYYxMaVFRZq7qKsmUBFwcJ981zxg8rACLw5W5qKkRlKg2w96PJ24rPM2PB/bnZVrpgOlGD+FbuicoVAUHdFv4usqUjkVq5iKAvi/HIDD58BNrDCc78EuwTOGZhA6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGDc7jwB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGDc7jwB"
Received: by smtp.kernel.org (Postfix)
	id 81AC0C4CEF0; Sun, 14 Sep 2025 06:39:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC381C4CEF1
	for <soc@kernel.org>; Sun, 14 Sep 2025 06:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC381C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so21803165e9.0
        for <soc@kernel.org>; Sat, 13 Sep 2025 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831973; x=1758436773; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldA2Tv//rSpgM2mgoWOf2ki3ZpiTNjsfn7bnpTA+85I=;
        b=CGDc7jwBSUQihQVQIYCSTo9KnHFyYB4/ytsUH3iu2jLEvSIPoPiC1nID/67OvhywAt
         6xCgm/BtVlPIfR0eZeXXX1UcvyV7lfK7gkCz1pToR+Q1mcq4w4BlTo91I1qv0nPa+eZN
         /xCt18uj67yAW9Oh1zeT73DIY+QNyjgrK+gmKCA4mgbD6wCDBmb8OxQFhj6tDW+syC6Y
         RYc9U2hpdSCdTDMrffDnYqw8vihyxlhLwBepKCYr/AyJF505ERYJUhRfvuCSpsRoCqlF
         i1/TjQ9yqrNP6yp77hZBUcqC69Zecqou5IvPtWRWiZD6IJk+jK7BdaIZOb2+VY7jL1TD
         i4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831973; x=1758436773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldA2Tv//rSpgM2mgoWOf2ki3ZpiTNjsfn7bnpTA+85I=;
        b=nGH3WYT2KsmeBlrSzdQVExJCAmCtvpSkRTMGYdQPp9D5cDS/2aYPkErXWGL4cUU0UI
         JvFIv01oE7IWKLoXA69YMvXCK9zRFTLEFOssD3a8KsJhYnHHjSBkOo/wUr0UF0py1qCs
         jNXH2ehRJ9Nbl+44nmRjBdg/qgsDLYSgeSmnV9MsPBqBcPeDVTJoIpQmVLOD1LEZoagg
         0qjtGIi76OZ43/nW1vIW4TW4mH7Zi3aUAGk7NSon1xjF9GSvtcqodT0xA/6WbxXmoDeO
         4Mpr743dQUSJPGo60kVdKTizLmPcfjeQDNND1IkCLjBMgmAFO511YAo1Rq52aQw0bCmp
         dYPQ==
X-Forwarded-Encrypted: i=1; AJvYcCURx0ykt4iXj+UmSXqmBMhyjFBaIU3yZ0UqvW2XQjcCAWpaKKjwNyliziXgF8X7UdhSoa4=@kernel.org
X-Gm-Message-State: AOJu0Yz0rBSFxuQaVWPnFkvaZnnytMWe6Tdy4rcVec33Cqro2mTJuwyS
	WYIOLbx4flXMBSF7wdkDWAuleeZAucMk17sLby0/liu+Wz8dsAVz2tU8
X-Gm-Gg: ASbGncvpm36gRg3uLujudJAEEUqOVubf5WyU28rE1RECi4BRLnD4AQbQDm9gRcREipM
	0+e4L443flMLL27j4q04Gc+NGpoqZ11/CB5zNrzjQPfluGGxSyezD1tWasF7vUGjPb43XXPJVuo
	CfA4n5mDl/4TClufmsZXF5Nt83QSkYbE05yoQBfAavMSMhCxXCeZuBjg2n1pxocn/SXtaHnreEH
	AVIm+YfeTxB8S3cBVpyMec/gJs2dusU69lrmX42D3kBaopKvYaT7zQwoaSHTnk9XZ1sC27d2V5B
	pzzsqp6KTFt7RWmfONsSHKeQUoJTBWwCHtmAm/Gf7cC34YluINQlv0hxhOIt4NNiB6OkzmG4qZV
	LBPlpFwvQBjWzrPyTX4itVYv8J4QpF/Bu0K//qZlPP+GG25MqPYk/AZ4Un2MgGyDr1aiGo48mkk
	3AOJHeYP5RpWnYChwv2Nu/w8g8
X-Google-Smtp-Source: AGHT+IHqdhP/BEDVPeh1xqm+EIUCLoLGr/3DaGswlta+efo6GD5amfhQUS/xtRQB1Gjk5GwaD5Mz/w==
X-Received: by 2002:a05:6000:2401:b0:3ea:2290:7cc6 with SMTP id ffacd0b85a97d-3ea22908137mr405244f8f.56.1757831973025;
        Sat, 13 Sep 2025 23:39:33 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9c2954b10sm1561270f8f.50.2025.09.13.23.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:31 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] soc/tegra: Changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:23 +0200
Message-ID: <20250914063927.89981-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-soc

for you to fetch changes up to b9c01adedf38c69abb725a60a05305ef70dbce03:

  soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups (2025-09-11 18:19:02 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.18-rc1

NVMEM cells are added for Tegra114. These contain calibration data for
sensors and USB.

----------------------------------------------------------------
Svyatoslav Ryhel (1):
      soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups

 drivers/soc/tegra/fuse/fuse-tegra30.c | 122 ++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)
