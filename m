Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B6E21FF45
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 22:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271803; cv=none; b=KRplaTNq3NeQrO5/KpSQUovG8tDGPzVT+DIt0hpwsONdgpXrTgc4JrjVE8JhbOsM8Y5XBR3zo/V9+HWZKXsaQBh1EMzHb054u1kDDkjaHoBJ+fBkg5N8o5iazqWMMviF9CJLlNH8UD4glUfzr6AztDtzM0WsnwTui70F8EkwL6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271803; c=relaxed/simple;
	bh=7V/JDvNgecmuUjPR+2RtoXSC7jjQ5Q4Vx3eF/7R+ohw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZKqWcKCHu1hksuVEB8e6rOxk5u0MpW+MxtLN2vwYLJAWSvxZ93xGlsgziJRsrCkyOyOhbRy7ofpkCfYkpkI8ZxWAovoIdAFng/5twIpZA0aKnAjFmeG0PohZ8Z37NDGknHKny0LLgJ+Q1F2CCVP/I57Zytc7/Q9KYIuy6f/yxtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecUqr0PD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecUqr0PD"
Received: by smtp.kernel.org (Postfix)
	id CF3FBC4CEF5; Fri, 11 Jul 2025 22:10:02 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA087C4CEED;
	Fri, 11 Jul 2025 22:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA087C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1359417f8f.2;
        Fri, 11 Jul 2025 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271800; x=1752876600; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbtR0HiiakPIrzdYCLsFZ7Pb8EfrjpxSPtZBTo8vi/M=;
        b=ecUqr0PDgo5WJ8FsMJl+qu3aHV0OifHOfasGUwMOYg/JsyFrbaB44eI5qScqn6XI9b
         M6klWGyqmfWRyNqCUK+ilXf7oFqbKnxcGgrMZOuttyO+It9UUDn5NezS270X+lTRD90l
         Ack4JjtKznUBWgDINVdu4C8IQDaGctCMiiHRrq9uuO3dOxKS0Id2kjkSuWvA6ZUOgKvj
         /d+lL8pZwvETj7N/9pMwsOWTG4S0Wu8QWLgE5KTZVuZ5yeFoqhrwsncRWN/F9JwGy8zi
         TIBPRtzgsH9Dkw9Sgs7458E0qy8E3y5LdSpKk2WZMAFyNi+W9DMg1fPdZ4G99/T5mB00
         5LpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271800; x=1752876600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbtR0HiiakPIrzdYCLsFZ7Pb8EfrjpxSPtZBTo8vi/M=;
        b=d7c5rKMMKCPZWFcNNPDYB7NiS1xLlF1UZfO3l2crrniTutAtzkdiVl74PJZx33KfhF
         C9btrIL+sl48Fh5otyUXKZYKswkNs9QFzNzWM0WIEiSPjWaJJDuwHZYOh3mNZSD4bjNi
         zzNzl5C0Tk9DNkmT+meiHdTlyX1+ryFXlyrKHruynildfH+z9Ex5s+QBF4ZpCzzOJ3T/
         fkkSwvWOsw6FDd/cDoux48f3BrS/YmS9rDSMWdlsuKMQIe83raRKTtBtqFNTJkcbYbn4
         19RG12JuVTo6B9HGO1uWSXSj+6PzMX19uwW0b2C8yDx7jCh1SpUnhsDQOK/A252KmL8T
         Qufw==
X-Forwarded-Encrypted: i=1; AJvYcCV6iwTF1ds2jaT/rRe55UP2tgIQOo4hz8huYidW60jYSdBG1JwH5rAk/KlkcHPz0FVK07w=@kernel.org
X-Gm-Message-State: AOJu0YxPyrUwSIDRfUvKzmavJufy9ToTxTwj+REt8hhpZbEOkhACW5dz
	KY4QGnrnNPKq94KDbbyLX63KLZqv6G+LGpWGnxQuCcYuBtXeDZ4Hh20KwmyYew==
X-Gm-Gg: ASbGncvu60mtVa50gw7hgz/d3r4E8IpamXr7hdDozVtLn1lXTSX0ie/ZN2U5fnnjBgw
	qaRw23p8Kf7zPHQ4l4fdpAb2vsJcaKEzReMnRF6+mDqtSJsL8D3ex/1tA6EFB8RXp6PIwoFITHs
	TkeekTdT2pzvdE9tR2Kz6QRvhSBaC5z0v1Fd9cO9C/QrMsJzWa5YY7+kjWCSCsyCidZtmkS2+ln
	92k2KBgkNsyedyDLU9d2GccKb3E48wdCDQ4Y53EpjbQpgf6SpMaJbkMoKTfChgb8vujJ6cRfRDU
	2IGsj+W0kJ2ssXVUoUxlGrd6T+ukAoSp+oF9SKqPEXDLj8K2oCiKYkTNnlufFxdYIq0beub+2Li
	BBNeqAGap+cnZSEuRmJHYtFF2B2Dy7CDQFyrkRKF7HOZ1kEJY2ebrYmOE9L23hwLBQ9ipu9+dd7
	4p+s7wo6nOivgZ2w==
X-Google-Smtp-Source: AGHT+IHVLhu9sQqqVzUADbZibqpiOXQmra1YzYG8sZbz+5Usd1b/VVnMLyp9rN8lFuXsffC1HiqoUQ==
X-Received: by 2002:a05:6000:4108:b0:3a8:38b4:1d55 with SMTP id ffacd0b85a97d-3b5f18dc7dfmr4258546f8f.28.1752271799602;
        Fri, 11 Jul 2025 15:09:59 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc9349sm5520827f8f.45.2025.07.11.15.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:40 +0200
Message-ID: <20250711220943.2389322-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-dt

for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269b:

  arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.17-rc1

Add support for the Tegra264 SoC and the corresponding engineering
reference hardware (P3971-0089+P3834-0008).

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (4):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/arm64/dt
      arm64: tegra: Add Tegra264 support
      arm64: tegra: Add memory controller on Tegra264
      arm64: tegra: Add p3971-0089+p3834-0008 support

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 ++++-
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 .../arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi |   7 +
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |  30 ++
 .../dts/nvidia/tegra264-p3971-0089+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi |   3 +
 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 415 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++
 10 files changed, 704 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
