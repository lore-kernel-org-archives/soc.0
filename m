Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729117579
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964747; cv=none; b=GBT6DMV2sXbqJL/EEGPhu/opjOO4+UfKu3eq4+UIZ4YIDkG+fSz3Utc3HkqvUMdQT1jRMnM7iKf/Conbs5LtRj6Xl+u6V6Vht/OnASzTtsXHj9uE9GXV39o6ZpDVRhBsmYT2F1a6tHtMHPnn5kxBtd6sB+eKFZyDOaFK1gTW2Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964747; c=relaxed/simple;
	bh=Fr21DkKe7uPovcuhU9v34TA4iRNkPF7Ka9OnObej6g0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ntv1Kc9kp6YnUaKP+bMcgBtdivv3MNO/gOt6z/dED2528PYfnId8qv/emIxKtSGlJ0Pa6YmzjzSfT7VMOlH2Z2y37XtPC/Z8A7PMTnQ5nEkpq1HI/F3A+ZEp2ngD8ur0XpXxxndQIyrUjcdPR3CGkubEWK2YVfS5bzdf6VMbbfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=l080Pl8T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="l080Pl8T"
Received: by smtp.kernel.org (Postfix)
	id C6805C4CEE9; Fri, 14 Mar 2025 15:05:46 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35FFEC4CEE3
	for <soc@kernel.org>; Fri, 14 Mar 2025 15:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35FFEC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e589c258663so2037168276.1
        for <soc@kernel.org>; Fri, 14 Mar 2025 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1741964742; x=1742569542; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tSXxaoqaOmMa3Slznv8S2xnGouiZjQdl/76oRMg/G00=;
        b=l080Pl8TZIj/cgkdsRS/Hl9+dY3C7ec3Lkeqp7przEf8Y/e050cMahGB4XyewPtbxn
         JR9rilT2E2I6WkYupsh3Ulv/gayP+6WIXn3MKVCcW52WkH2JHeC7JpGQrW7m6vzxUePd
         4sw5ijN4df42LX/t42EBYnj2dwdPNFl2R9lbwIHV6HrL9X7vAb7scK1tlgasnG3dNz8y
         B/QVjPUm1U9kcFItILg0tlP9GHY5CbgQvvmb7PC8xbHjWUOCPk9XBnGdgNMzJK4iAUB6
         n4lakwsUc/AlPh24d2MktTzmdWNOo/Cgm724HPhgrMOpRNFDQu022o708Zb2WnJW1TPk
         jy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741964742; x=1742569542;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSXxaoqaOmMa3Slznv8S2xnGouiZjQdl/76oRMg/G00=;
        b=E6EAdSggIcqZn5SLFAxtoXqywazt2PEJk0D/qHtNA2F1ofGbw47AosQX9tEfhqhQEX
         1uPR+xd/AgWmszkXARFZoXFTkU9nxRLRsBRPIrlC09NxHvWFLo/WBSIPOS5FuFUJiuLs
         N7C7Kc8tI79go7C7Aei8mldj4eh9ToaE4F4tzRjEdfkMPEoqNu00b1kghNFrWzX6flMP
         YR3jnB9hkRhFdWppHd0aIPDH6LrIFBkK9tTlXbEilnSbPUBodSqs0uA7jJww5G6bF2Hh
         yqVukW4SXnXfFidSIJKtEtI5D6j9Q7LRJbTaGTsBtU3Ha44I226sIrkqjXMM8/I6G10f
         Wnkg==
X-Gm-Message-State: AOJu0Yz3z6OHNCSw2TImq5b8xdb1OHLyN7mzKXE/N9YOpxW83pubnK1J
	+tO3hZ/KnBNiyZwSwNH1y3kSDu0FumTvZMj8YuuDe9ytxtV58Gz9AK3VUFGSREvEOzEiadqfJXb
	vLPFqU+TiWdA6WAz76mtmSYPlOU4fTj79D5gQ91Ei2LjK15Ze8Jue
X-Gm-Gg: ASbGncuJiITkZqZO5O0umD2ulZ9pMp4Q5/pTrUtJ/1bgRxmuyXfdQcATF8rKUbOFTm4
	Az7o0OHy0+sSABjHSEuBWiTlwKRD2xqEaGKxKoC/GnmTY2yEPEjVwcdA0Hwi2O6yjGAW0wuco25
	VDAPiHkBKr7wI7qzj4YZJzG1gsH/g=
X-Google-Smtp-Source: AGHT+IErmmVkyNQov5Nd1+Xs71JZWSwc57b2CHBJnpd+Wy8GkZC/5L2QJoES2aegCf8CKQTf+m44eDFuMReFg2cWef4=
X-Received: by 2002:a05:690c:6404:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6ff45ff5cc7mr31632587b3.29.1741964742689; Fri, 14 Mar 2025
 08:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 14 Mar 2025 16:05:32 +0100
X-Gm-Features: AQ5f1JpYX8ZmFDvOocARvlWoAwlfJN6MLmhqbrBxLvebmV4tl_7rNn7qQnD9bs0
Message-ID: <CAHTX3d+T+_zvwAVqGO+J_+Yia+wXAGsaEbPi1ye1AUYXoq6dmw@mail.gmail.com>
Subject: [GIT PULL] arm64: ZynqMP SoC changes for v6.15
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull this patch to your tree. Tree is based on v6.13-rc1 but
that shouldn't be a problem.
There is no conflict with the latest Linus tree and also don't see any
issue with Linux next.
The patch is pretty much cleanup because firmware is not using that
parameters anyway.

Thanks,
Michal


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.15

for you to fetch changes up to 5abc174016052caff1bcf4cedb159bd388411e98:

  firmware: xilinx: Dont send linux address to get fpga config get
status (2025-02-17 15:40:01 +0100)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for 6.15

- Align fpga config status with firmware

----------------------------------------------------------------
Siva Durga Prasad Paladugu (1):
      firmware: xilinx: Dont send linux address to get fpga config get status

 drivers/firmware/xilinx/zynqmp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
