Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B91263C69
	for <soc@lists.linux.dev>; Fri,  9 May 2025 22:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829677; cv=none; b=n0BAxabe8WtVn9Ing+7fABK0HnC5qRv+gL/dHdVmIYCqB4ahPHWAVrt4ArArjC/Sr5aM1FcdDGR7kNMVFSzPpSfA7LfSgKiS+9X0bSy3LLoKpIJXWFHaou0+Q4nA1ExZxadvJhp0NwXFXxMeFebWAFZvv80npSrDt8KylwWZUkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829677; c=relaxed/simple;
	bh=fpcCe5Pe3DQ99Xt5/ZVJQxg4XXuoBQ3TXj482waHmN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+G5A1y2c/CapAyKePGZQnKhqjzosRSYDc9RGtIry2WVoF80q0fhIovSBEzJSsNZZSh/MYLxHN5LBzCs6yoD7PCHMPM7PkPR2UcI/ZEtR+eWOAggguodbMb6gENhd9SeikF2NGxwxCiveHh6iRSbxNxV+3MatKuQ3cjpErfHQE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=J4Yl++zw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="J4Yl++zw"
Received: by smtp.kernel.org (Postfix)
	id 406A0C4CEE4; Fri,  9 May 2025 22:27:56 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F13A4C4CEEE
	for <soc@kernel.org>; Fri,  9 May 2025 22:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F13A4C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7423fb98c5aso1070577b3a.0
        for <soc@kernel.org>; Fri, 09 May 2025 15:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746829671; x=1747434471; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlfY6HFrt6KjD7LtGN0cH5vsLg4tj5XTdmzdfNRbZFQ=;
        b=J4Yl++zwcxQ+h27dxa4t7CteUiAdpms4ah5m9sn7R1TXF55mWyBCqvmrdeOesdEm1O
         ncAIQio8gAc+BKqPFHSJE+qDKuV2u6SjYEPfVK7W/OWL1GlKBhP92ExblXNNGjCSDI2i
         Cl7Ozj3n1Bhn3fr2az+uCF5YYK6Qp7Vdn1eJRVbM5NoMo5RoZfismZUza1QUKlCriE90
         AkNzLglDdNU6A6MgulOv5mP3BW9ZdB5y9TYJzRMg6PhFCuz/GJyNlMX61eVGi7iq9eDo
         chCSXOgQKTouwRHprYf5ojpDWpNIXTl2h1O/STKgHqyBDT7gIaLuEgkgpeUmjbCyt1Fy
         GX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829671; x=1747434471;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlfY6HFrt6KjD7LtGN0cH5vsLg4tj5XTdmzdfNRbZFQ=;
        b=ifIcoYAx0x0gZbez1Ip4vuOqgH1oI/p2u+dDqv/j6Y6nSTIQsFhUpB7HvRA0wdjp8Z
         z4CXsr8PAGo3wo9gpeVUclmqkJ00+rXQe1OdIaz7ajI9w0G5ardDKp2yfhriJyjLYimp
         FetyD4qbHneLh7GO+DEb6/+lE6yAnMrLIZNY/uol5k9l1zGhn7uCYBcQWwIU9t56WxBD
         OE597vuydfkj/qI01S0b1MRCEU7+M6ApPPMrHwyDyXPulIxglgbJd8r/Srp164NFjGEh
         Zw3AhPhuth0QXfwa6WUiPT1l9K0uH/5jrGveYY5+Vw8V4FuFJN8Sm4TQQGEC8TPtXYCP
         KdIA==
X-Gm-Message-State: AOJu0Yyg5kWwZ3tuhbetBLP8bLaucfa3NIC6jTMaEgVJMu/+kTuHRfO3
	HlBjo/58DFhlT/WxHC5SPmR7XMZZCKz98hqJpYg3EeZOS2PDTbeHMUS4mnts5cER6pedEFScNbx
	4
X-Gm-Gg: ASbGncuz+HU4lGJGP7ZeUoVi8ZIv9nP7wV290ITLwZEKs7+A3X8Txo7D4nwMX9h8Ysy
	Ppfx3rIRY02Lhmwet4Dwp+k0+ktF8DSK8zQFYE4WUFYHbUj4qZhKI5+I/jEGpM1kwV0DK6sNqaG
	sfssERWuRE8UO0ucBDBBXgl+szO6+zO74Gw0p0LQnwNI6ox2Qn5udCFomXI/mXXuhipVlX/rROh
	2PSkDwtI6HwB95Xg+judPj82nxjsWY/meKeTm3oMPDav6qWH/vw1I0ryYFYWQjNj5KrGdQu+lUr
	5Ov96XXJ/fDxEHeXVRyBt7jdf8ei7KL+nrebgxVeYpQVU99skaiiwUhssQ==
X-Google-Smtp-Source: AGHT+IENf7Kcb8dJPQCDteAQPpxoaSfjEOkbSR/iBVh1JMloeodx77VyrnDGlCBUYNSjh2bS0sBuDQ==
X-Received: by 2002:a17:903:41c2:b0:22e:62da:2e66 with SMTP id d9443c01a7336-22fc8c78182mr82262675ad.24.1746829671116;
        Fri, 09 May 2025 15:27:51 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a0e52sm22426175ad.216.2025.05.09.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:27:50 -0700 (PDT)
Date: Fri, 9 May 2025 15:27:48 -0700
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: T-HEAD Devicetrees for v6.16
Message-ID: <aB6BZMWDXoRXrZVf@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.16

for you to fetch changes up to a4c95b924d513728df8631471eb3b1c300909e21:

  riscv: dts: thead: Add device tree VO clock controller (2025-05-07 23:38:41 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.16

There are several additions for the T-Head TH1520 SoC:

 - AON (Always-On) node which serves as a power-domain controller
 - Reset controller node
 - VO (Video Output) clock controller node

These changes have all been tested in linux-next with the corresponding
driver patches.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Michal Wilczynski (3):
      riscv: dts: thead: Introduce power domain nodes with aon firmware
      riscv: dts: thead: Introduce reset controller node
      riscv: dts: thead: Add device tree VO clock controller

 arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
