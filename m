Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9234EB38
	for <soc@lists.linux.dev>; Sat,  9 Nov 2024 02:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731120148; cv=none; b=czNCyr5O7ekzDYtnWsEJZMY89FLMKweftD5rrjMo0B0pxrlJujMteDIvwb00IHSDxQfg29A5pA2ZAA2vNpWO55hJwc4RX/UmnH79ujKZb7r5oSBOlI05Ym+ldWsHIC6lu3MXyw34KgI3FLilivTGqOVasZfowv/Re9zBwnpSb4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731120148; c=relaxed/simple;
	bh=LjsF1zz6XeiMc++G/iNkdGaH6gH8mm4kG1ByozwHDaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LZuSj+LbBfup1G/ZQ/Drv38dcnb5Xy8csmtt+EBWuEvSntULolcEA47XL0KnMRpuU+d1KPw+pgpJJB/NvH6jQtOjJDIrBznUaD2KP8XedM4nzRnvUsbByGNEwhmar6pT7XvYue/n1Sccpc75cSqLNWXkcAP+IcY1EUIfpngGVF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=0aMt6GNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="0aMt6GNg"
Received: by smtp.kernel.org (Postfix)
	id DF63EC4CED6; Sat,  9 Nov 2024 02:42:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 057C7C4CED3
	for <soc@kernel.org>; Sat,  9 Nov 2024 02:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 057C7C4CED3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20caea61132so24821215ad.2
        for <soc@kernel.org>; Fri, 08 Nov 2024 18:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1731120145; x=1731724945; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/kq/jig55oiRh/bx6L5lLBF6mfYKjE94DkUXbQGw1U=;
        b=0aMt6GNg9R5Yd7/GitRk+tS8zPl21zogimHeuL67nAau5LJNnQeECZjmbQDek511++
         hbFJzzqO10IRPEyMqWORCi2yj0nhOHhHqxyjaW8fkdt9vBYXc+JF5AAP510GjoYwbc5g
         f1d1QL6GKd36PTNEJRK5ZLpE+cqb508vTkXpH49hOS3/SzlpGHqYLkCTMRUcFzMU7I09
         mUgW+nNqZX/1YFYYblMOBdfLesPYVQO4JpLLgn23leYQy/CXBYlRamtMsJURjvMAK/iZ
         mjRxWebhbPElOLCS+ADfnqHwjd3tFcVgkAPLr9+CJa1XxguJo+MGAsTljhP/5h5icAev
         73LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731120145; x=1731724945;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/kq/jig55oiRh/bx6L5lLBF6mfYKjE94DkUXbQGw1U=;
        b=krYGZOZ8bzeIIvz6DzDa7A/2o/5QV+p+M+fqAD3EOqlCuttNJ5wZhVL4VQE2XMBMyT
         X3amddfseJa5/tHnwqEbBH2RbUuqQdOa0w2IcYktrwyYiWeDtsnN4A50/XUl37+kKGjo
         YJqV8rjw9BZfgucUxVvGIpj95XPLzlscugY9PDsVau0StFtLJkgNpQ0ccyLv6wqTxJCT
         PxKymlxNoEV0HKRzxRdywgss4vhRYS+96HPJMtTNShhomf5GJFwgYpUrxKP20UXtPcMy
         3WKJrrEDSSDYGZXO5zMEV2rffzNN+xsFbdfba9vQSYJEEsp50B4PrWzSHz+96blrYO65
         h6og==
X-Gm-Message-State: AOJu0Yz2a8C2SDW1C7w9hLQF0Je/LqFxHPz6yfkcFxWmnGtT+72q5Srk
	QCAhd9swLArkmQ+tKn8kfjP9xmoBn0jD1mmPLUFSdDZ3tD/cp0Oe8DiuFFyutCdFsFJSplpMm54
	Q
X-Google-Smtp-Source: AGHT+IEaqnxKIzWBmEEzYyvufch5G8Tuk0X5vXmjpFy2gAQctA1w0BMtU34C3aumXJGf7VQyRyPOsg==
X-Received: by 2002:a17:902:ecc2:b0:20c:aa41:997a with SMTP id d9443c01a7336-2118354d664mr70046865ad.34.1731120145214;
        Fri, 08 Nov 2024 18:42:25 -0800 (PST)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6e0acsm38035835ad.257.2024.11.08.18.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 18:42:24 -0800 (PST)
Date: Fri, 8 Nov 2024 18:42:22 -0800
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: RISC-V T-HEAD Devicetrees for v6.13, part 2
Message-ID: <Zy7MDgtCtPkxLbjm@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

Please pull these thead dts changes. I've run W=1 dtbs_check and the
new ethernet support has been tested in linux-next.

Thanks,
Drew

The following changes since commit 2a3bf75a9408c40403aab39336274c8010b4c815:

  riscv: dts: thead: remove enabled property for spi0 (2024-10-15 10:01:18 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.13-p2

for you to fetch changes up to 7e756671a664b73b2a3c0cc37fd25abf6bcd851e:

  riscv: dts: thead: Add TH1520 ethernet nodes (2024-11-06 17:03:42 -0800)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.13, part 2

Add gmac, mdio, and phy nodes to enable the gigabit Ethernet ports on
the TH1520 SoC-based BeagleV Ahead and Sipeed Lichee Pi 4a boards.

The dwmac-thead driver and dt binding have been accepted by netdev and
are in linux-next as well as the dts patch in this pull request. I have
tested next-20241108 on the Ahead and LPi4a boards, and Ethernet works
correctly.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Emil Renner Berthing (1):
      riscv: dts: thead: Add TH1520 ethernet nodes

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 119 +++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 +++++++++
 3 files changed, 260 insertions(+)
