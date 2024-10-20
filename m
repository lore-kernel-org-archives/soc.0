Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD34192B79
	for <soc@lists.linux.dev>; Sun, 20 Oct 2024 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729434972; cv=none; b=Qv6BiPxxJENLfSMPQBk4wW24M1zQeV4LZJai8/sLFBcQTnuGAx2Uf0W+tdsk2b6HU+7liPfTD2LIxYgb8SKwHbNIvTEN8+rqpbv7OZlbq22fZbImtHXXtFPUtuI1T2n0RLnYGqmWLLUtPSq4rQMTq+HsR8YXZgQWctxWRJWBcQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729434972; c=relaxed/simple;
	bh=nI7CzD0dROhg5LFR+SbTGgNA8U3esGCj22cTRyP1R+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAbjspOXJ0z4gSp3y30L8pCrF0+BqAIFscpclyuUfuNrB4RW/d/zVPjM2uAQtAUWUggTS2mH4WT4DvRk3nsJcPPBVfCyn9lytr4BkX92OdSGdCUmQ8sLT8A5dtINBD/tkQ30zSYhKY02EKdfh+DSv8ZA6RMAS8wWvF4vEqpJGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=Z+tiN8GO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="Z+tiN8GO"
Received: by smtp.kernel.org (Postfix)
	id AC46AC4CEE5; Sun, 20 Oct 2024 14:36:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F9C3C4CEE7
	for <soc@kernel.org>; Sun, 20 Oct 2024 14:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F9C3C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso2654171a91.3
        for <soc@kernel.org>; Sun, 20 Oct 2024 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1729434969; x=1730039769; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKUwNFi+RGRukUqB0kD8s+grnaOyo0LZlXvjUDFIUlI=;
        b=Z+tiN8GOAg3WDfTpx3kjHGxYuSrzyJtCT6M/00IHPnatsNO25znPmnGBYOidZD943o
         13JhHSrZGqBE+zxXNdI+ffh4OO5NNaA9+1AToVR1JeUt3a9OT0aUJfhRyBaqS9wme2PV
         4nFS5pivtgb3eDPG5oE7B9yvlFxn8DGmhZELZmklg0ZR0sUHluTZOF1RGsBjJ7vFkd0d
         ZWWtm3UgqE2Ee9kLCkY8COtDgkvD9v6K/Ur89zYK67QczCFluZpXQjx4Qa6xP3rFUBck
         OdgrYUyPPE50ECNIIhaNlzy+C2wCPnBMen5mcSNCV4r8ixxu2f+Myp4Ox0yY86xer/9p
         y0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729434969; x=1730039769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKUwNFi+RGRukUqB0kD8s+grnaOyo0LZlXvjUDFIUlI=;
        b=MGa/2nlty+ryVzoPn2/koWgiZPEQgDuDrzp7fHDx8qEzjNojcnRtQTCv4VOFQ/Ne65
         28mJ29KDjekhfJY2QkQqg6fO6RsIBNWTcq92hoRy4EoYF/bywfoffEiSjUldguHCIK0F
         IJoYVFmj1XOqDx2hbmCmj/9cmZzpdd5MiinpT889qNziXGls6HnXkGb8DDfM4HNcFbsc
         eyGBMtH8LuSaCzw3jwbUV85plsll07K1oDDvwcZTO0zZWqgz7H3OJfz7l2Gsfr9xADW1
         2ibvJ1+5i865GtGAHgoJizpwoJ+nG1GjMUboXKyoyknG6WNc+PaWrsF9R3iaAwgz8dqY
         aYaA==
X-Gm-Message-State: AOJu0YwanKs4ROhlSvuY4LFeW+b0DXbCSpYalC9KVeV2P3Oo/a9qoqtx
	N96jzwOyXFSPqz1QnWBDnRIMndBzhn3TAP4oMcZKpfSEykcGcY+ebz1RSmPbbhFZTFYhcUf410v
	A
X-Google-Smtp-Source: AGHT+IGJNYH1gN14k1HjiG8KMaOw8wGH7bmIO29hzeC6OSNwC+ZYDPZ5SQj59jaNoa9SfDiMXNrNKg==
X-Received: by 2002:a17:90a:e392:b0:2e2:cd5e:7eef with SMTP id 98e67ed59e1d1-2e5618d9edamr9931854a91.27.1729434968747;
        Sun, 20 Oct 2024 07:36:08 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed825sm1572538a91.35.2024.10.20.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 07:36:08 -0700 (PDT)
Date: Sun, 20 Oct 2024 07:36:06 -0700
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.13
Message-ID: <ZxUVVk9gWJAVrp0g@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

Please pull these thead dts changes. I've run W=1 dtbs_check and they
have been in linux-next since October 15th.

Thanks,
Drew

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.13

for you to fetch changes up to 2a3bf75a9408c40403aab39336274c8010b4c815:

  riscv: dts: thead: remove enabled property for spi0 (2024-10-15 10:01:18 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.13

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC. The
yaml binding and pinctrl-th1520 driver has been merged into next by
Linus W and will be included in the 6.13 pinctrl PR.

The TH1520 GPIO controllers are already supported by the gpio-dwapb
driver. This PR improves GPIO support by adding GPIO ranges and GPIO
line names for the BeagleV Ahead and LicheePi 4A boards. Support is
added for the built-in LEDs on the Ahead board.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Drew Fustini (1):
      riscv: dts: thead: remove enabled property for spi0

Emil Renner Berthing (7):
      riscv: dts: thead: Add TH1520 pin control nodes
      riscv: dts: thead: Add TH1520 GPIO ranges
      riscv: dts: thead: Adjust TH1520 GPIO labels
      riscv: dts: thead: Add Lichee Pi 4M GPIO line names
      riscv: dts: thead: Add TH1520 pinctrl settings for UART0
      riscv: dtb: thead: Add BeagleV Ahead LEDs
      riscv: dts: thead: Add missing GPIO clock-names

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 86 +++++++++++++++++++++-
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 30 +++++++-
 arch/riscv/boot/dts/thead/th1520.dtsi              | 70 ++++++++++++++----
 4 files changed, 202 insertions(+), 23 deletions(-)
