Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115D345729
	for <soc@lists.linux.dev>; Mon, 19 Jan 2026 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812177; cv=pass; b=bIy1Q2EH76YA7rYRQyJShZ58TSer8i5WVfmVx60RoNZLHKgv2oMg1lk6MlYiujf05HGsbmRY0ZOnSEZItI/vCHb22dlCHiFDwE9N+tpFjvQ33yGBs+XSLP9Y+pqeNOJ64kT9OIaU89BeRGnegRKkNgiFVgEgFLTaxoPI8AMj7ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812177; c=relaxed/simple;
	bh=Q+1mv3FqsRS4v1TjxPKvmScwZITSs2UZK38NB9h8nYw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=s9EcOkmD4OliuOYu6A7OpedAoqLqCor7vUYIuhOcL/+q6ULgYrbnXzek8dE/QC5zLmm+xC8RYbnw+OVHNwUZ5E/GOdBdNSOFu3sULvhgrF9axjIakoGIyUtAdcN78/tvlRsVq9yLhRYMDzbsoZQe1DZuNFazUU196mQBi94Rsc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=FoRczcAZ; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="FoRczcAZ"
Received: by smtp.kernel.org (Postfix)
	id 16753C19425; Mon, 19 Jan 2026 08:42:56 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D84EAC116C6
	for <soc@kernel.org>; Mon, 19 Jan 2026 08:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D84EAC116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64472121ad5so2737384d50.0
        for <soc@kernel.org>; Mon, 19 Jan 2026 00:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768812172; cv=none;
        d=google.com; s=arc-20240605;
        b=fDCPK2ior50+o7Oxnp0+03Oc9nkf06iKF0CgGY7MO4JtZp0L+zg5YdmY4mSFguuzW4
         THUApUsRdz7RpJsp0/a0WlANx1vxvA1m/egCFF6OIkxQE8heO1+GxLE1D1y/q8+X0/ua
         IX5M8YTmYn5WmPpe8faJMeU9Q4gcRVjEozjOBqxk8TXqi/FHmD9FUecPU1lSBw0eUBgH
         vtr+e+s4naW4J3Fnn0JAa6aBJrUO84HBaSZ5bXehBeviyV+FsMLWw5vt4Qry7BeTx2+k
         TbIz/Gc4M8UhKX3b/B0NsjzInAbfztD7jtbjDYp6PaBfjOTwd8vza2kF+Npcr7TgwoLr
         sw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sgtC2P0mVvpRBC7CXn0tmQZFh0DfwTg0wP6M7ECQQ44=;
        fh=ngnzniW9/251Blo+3H7OvJM/allDljIxuXeYmmxYfks=;
        b=SMuA3BDBg//pBalscsfNc+wTv7UAAQQJWpwBD1cozI5s3FosD/4zwTDtxS6ygebd09
         i+lgGPiV0XiISbqxG1RYtl/Ad1V+lycTmf+z5Ame7OE3Lmv5HH4sPbrFpQ5OtLPz86WA
         EtSL6dZMHnpXUB8qwQb74XqwH+KL6gOPlaHE4Y1r9iDP62nb9stN258wkO2C66RTZvvH
         LAjvUyHBnPy5oOEIb8YfA7AJL7IM7zInRLmG/muZzQ9at/2+0nIrGCZ523APsIq2ShF7
         +px7qZkkIrqfM/EatxrRXxNfajbarljuG+m20k8wEY694qNA2KyIH6myUik/QU8UqNLJ
         0nQQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1768812172; x=1769416972; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sgtC2P0mVvpRBC7CXn0tmQZFh0DfwTg0wP6M7ECQQ44=;
        b=FoRczcAZMEQISksWiDIDn39DkrawbfzvZBavfHoT1o9Mc/LU1sZd5KRnvBKq6fG7cQ
         P8ESoT3QBQhrnIbFl96rLHaXdjqtCpllhTbKMfqunMquH5HInCfcIl5EfGW/0bmQIkpt
         xiJiFIuTdbqLTOcRSurte8zG3vhKTRRB5IOUWdXy97d17CWxYMtslOkCoBI7LQ8Im/YO
         E8c1AMF+ogZEM/ULpC9xjJ2fW8UCzJpbyua/zeoQuAn5yy1Yg7rZ6B/hzVX90MqKLAB4
         U6yj2wMwYSPghlOp5hYsnaDoDWXBAcK5RRhNBRdQGSKIKyLFHWyRaout0F7GiEE1Zlfm
         zadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812172; x=1769416972;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgtC2P0mVvpRBC7CXn0tmQZFh0DfwTg0wP6M7ECQQ44=;
        b=N/51H/dH/7GndKDGSyOqUFZERrh5Vsqg0UhOTGcOtX2wgsN3+ETPOlrnbZfZKAoSwQ
         Wx/53OTpxmujWVkGYszmu+W5T2rnvJu/i92rYlemLefn6NBYoyr32xa0qD7Yh3IvJd63
         BNSuplv9lBDxntcejJOpYVVy4DrWK3xe4dDCn8HmNm3KsfTLBGLwcpFN+6wll/2nTNyG
         llWGH0FFRE5xREPrXWjQMtq6u8uoiVZTC8QGRhgkkt20dknvO6aRIZxNuLh7t3v7rb7K
         HJLSf6TRc22TvHRSxRy+q9qSPXBNbdepQjq7+eZfK7rY03+v4H/slyTNp28/wlAXVN+s
         9Jbg==
X-Gm-Message-State: AOJu0YzgN/ILXY8sBf27KKUd3bmygIX2uQgEowGaJMnRU8HUE9/J0l4Z
	IxSaVpdmIIDMNLOgV7Npry7Hy1OKj8o5bxqNvVqwlmB412tDGrEuxYUskVmfF3a+xAqILXZN1ME
	JS/Xz87Rng5xXHTN8mWY68l/7kkbMyDjbU+P1CdATiCmN9QDxplAa3CfV4vo=
X-Gm-Gg: AZuq6aIocFS3x2QGrF7tm3QMPwCsywHQCFnwcuigVR73J0ug34NddiMsoj3eEUQ3z/a
	rMeKn7gdM2YeNrFpFiLNzFAEStaFGYK0fsTSHV88C9hS+4NyQKJ9Wy+9K612Qb1XnUDVQ72ph1g
	2FrS5yFkO44vDLtA7EUFwb468rMN/gG8IcKtPMXFLTHT9IgSmDoC/FPbru42FDLzm25zb/1mrpm
	A+bJvl5/V6ReEkALKNkPJGSCmf9K35LgOe0g5kf7JnXEX2gpa6/0UZbEFGnTdcCaCLdpjz4
X-Received: by 2002:a05:690e:1c1c:b0:646:e354:731e with SMTP id
 956f58d0204a3-649165108f2mr7930276d50.83.1768812172124; Mon, 19 Jan 2026
 00:42:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 19 Jan 2026 09:42:41 +0100
X-Gm-Features: AZwV_QgIJrAfcDgAR-LtLEPylnr7b45tioQdIgSQNdPcHEEapR48pT8n2By-VS0
Message-ID: <CAHTX3dJOkqMPogu=HeBtQuVCK3_-73QPVNPco4dxh3AaOOXUhg@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v6.20
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these 2 patches to your tree.

Thanks,
Michal


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.20

for you to fetch changes up to 1f58ad77a8b49638ad2b95b364cddc12f20cd011:

  cpuidle: zynq: Switch Michal Simek's email to new one (2026-01-12
10:21:30 +0100)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 6.20

- Fix Michal's email in cpuidle driver
- s/system_unbound_wq/system_dfl_wq/g in zynqmp_power

----------------------------------------------------------------
Marco Crivellari (1):
      soc/xilinx: replace use of system_unbound_wq with system_dfl_wq

Michal Simek (1):
      cpuidle: zynq: Switch Michal Simek's email to new one

 drivers/cpuidle/cpuidle-zynq.c    | 2 +-
 drivers/soc/xilinx/zynqmp_power.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
