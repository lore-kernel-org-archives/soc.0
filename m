Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AD134FF67
	for <soc@lists.linux.dev>; Mon, 19 Jan 2026 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812766; cv=none; b=JMCNSGyyy6L9DN7Fdto0KBnV0pINobq49BC4yEDaQP8H0UEXfkvVDMm3ov0cpPYsadT+YgouVRqyynW5p/ahYYGLM9ExZRT8La9Yzb0T7I8xGaLuC3fobcPWFEQ3AQS7t+//pVX6GizbtNnnQ6GLmAw+rSRZDWTv69u3d/zEpOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812766; c=relaxed/simple;
	bh=2V8tD87pve4UfhGP7Ey7k3X/yToIm8zr5ZMwRtkdQo0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HZjrLiS4+VYaO3RQxa3D3EBQOs5MTm29ypdMlqHrxrPTEI6g8CZVtScWLdIdxlWqrdBeGBl1q7R08WsW8QwKl+8/9NkcIUMlakBmwXoonzU/fHhvc/N7cl/yCVZ3fJsEI4ibpsZG57oObyHOGAnkppXGYM7FSZpKSPcv/Hy6XFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=S4cvXN0z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="S4cvXN0z"
Received: by smtp.kernel.org (Postfix)
	id 473D1C16AAE; Mon, 19 Jan 2026 08:52:46 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E7D0C116C6
	for <soc@kernel.org>; Mon, 19 Jan 2026 08:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E7D0C116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-646d9eb45afso3293006d50.2
        for <soc@kernel.org>; Mon, 19 Jan 2026 00:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1768812764; x=1769417564; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H57ytt+CGjRPah9T4NNX0HJjHszWwEHrR2pXvanUoG8=;
        b=S4cvXN0zwe7iPzagAEtb0x2BtOfolTxcIgS4XOsABx8gok+/GGNWnJYIJM7U9KkLwT
         WOWhLnGW+Npqk+BAC7EmD7mEeujR90qV6je+Qm57FSHRBxZ0qH1v3nUGU82kPdAgiSvW
         w2qiExRD0UhlA4rLzwW22b43hs0JWcUx+pGuX0NBWynBwmyv6BDFBi587WGiKBAtrhFn
         Tdp4UfsIYW6IOCn94KppnAHItJQasXi+Gw7ZoUGmYjrgVveK7Zvg0WlLIljVTh+Kbo6x
         stjwWhWAVLf4R5GGUoGKvZCuvpr2QI+83lLRJPNWesEm4NhNiCWw8Xuc6SP5eYTy6v3l
         3QdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812764; x=1769417564;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H57ytt+CGjRPah9T4NNX0HJjHszWwEHrR2pXvanUoG8=;
        b=BV2GMMPbbvtzShj6qcLBv3yeR7x6Jg+mWspqts3f+4l7AHvd1U8zRUDa92IAhezSBw
         l+IjjtCO3OGjchvCXzQg54qcyDh1zKlQyVOEDEbq+DFFjfATJe9ZjJTixNDUYbajJqE/
         TaO6noZWCDNun63K++u0nQleiD/bzYknjxxDnUqWuAFrEF1vuS8NFKF9R4DKFiWtslr9
         znLYjRbK/syWioa2t3JecqNSHV+ASm201RFNv9ZlwsvWsHqvOtznigxylj0AR/U7qLxG
         y/6dXbMTYRi3G95tUuSFKIfATQGFGBhtOVLP4KGQe8B1f6Envwc2GhiJ0K/QfOBWKLVe
         3Ykw==
X-Gm-Message-State: AOJu0YwSfTo5wZlKfDrA/0137litxjDI19o/8txlSayFoL+E9uSZKCgC
	7VV3btjhOQigaDBo9g+uesGMg/fZruAoQGVF9pqgesW/AsSB9IApby4Eq8JsPQeZQxlLgkzJAVR
	3qaODKvm411bAM7xxPlUwuAkH8/0e5RyJUTohsV6Ojz1VnrRNeUMPsW5ySyE=
X-Gm-Gg: AZuq6aLcjcimz1CT7csycQq/tza44rUl3sMCo8WolcTwv4nrhCkFEUFZOczK7D0n66o
	4/2M+RxebfoSQzYYmC9PieZYqtoCHHPQra2uPLOHD9xlH7hyJ8x4k/XZsNEKCabaZj3MLRDD2IX
	I3wi5UsqbSzoFpkvE70ISpTLwyH1dEsOhsp6PhLkTk7Yp0mT1GA6mPWxoiuO9RUC6mIZmxPqUJK
	xMqNOg0tEfuiUjcilgfVUlIrfJ+M+BEdnRW62/svG0BCkEhduyrkSpD+QLhgfRcN7oXOtqH
X-Received: by 2002:a05:690e:1507:b0:646:e379:5ad0 with SMTP id
 956f58d0204a3-6491648acf2mr9214573d50.17.1768812763695; Mon, 19 Jan 2026
 00:52:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 19 Jan 2026 09:52:32 +0100
X-Gm-Features: AZwV_QgqjEXi5Tc-0GhpMuTQWD2vz0XHZwPZzORCGW_nu9b6y_UAvgVHFpS1w58
Message-ID: <CAHTX3dJDXwA-y-DaJbM4x+UEBJvwhCr_xz4xGf0kF7_8ufvNWQ@mail.gmail.com>
Subject: [GIT PULL] arm64: Xilinx defconfig changes for v6.20
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these two patches to your tree.

Thanks,
Michal

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/xilinx-defconfig-for-6.20

for you to fetch changes up to 43cb48478719707b3ab115112b9e0168292c8270:

  arm64: defconfig: Drop duplicate CONFIG_OMAP_USB2 entry (2025-12-15
09:05:45 +0100)

----------------------------------------------------------------
arm64: Xilinx defconfig changes for 6.20

- Enable missing drivers by default

----------------------------------------------------------------
Lad Prabhakar (1):
      arm64: defconfig: Drop duplicate CONFIG_OMAP_USB2 entry

Michal Simek (1):
      arm64: defconfig: Enable missing AMD/Xilinx drivers

 arch/arm64/configs/defconfig | 42 ++++++++++++++++++++
 1 file changed, 42 insertions(+)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
