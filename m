Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847F23AB
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710871; cv=none; b=QhMuUJIlY7HkAFDhyxrOOcceTEZ9ejAyzY3x9DYAhrU4r5NEeEG9pYAc/ed1tQdgkMYzTORzCwjP7uTKqEFvotLLEdkdKczyAN37Z5pk4U882ZUtYVpd5xZTY4XC7bdIkpFWJqYMM/rOMKabfDPcT8LXjbcxssd88LACOvDpkRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710871; c=relaxed/simple;
	bh=PjIi21dI7IqV97t2BSWH70bIxiticHqWnOYuq4P1Ndc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LliSB8wXPBd8NN3F08iJfXrs2NVm8gmKcHTAVCNxJizGv63LL4f9EJjN5Ep9B2V6kUnrS7TBVeN+Msz404c6pImGJgKfXHRVhc75VZAIxhrAdU1z+RlEtdAz84MOxNQSUZ3lscnSqmQFqdjqWJ0rtSOWkDCu3XX9c5Ei+mDiF84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Hy3jQy+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Hy3jQy+V"
Received: by smtp.kernel.org (Postfix)
	id 3040CC4CEDD; Mon,  4 Nov 2024 09:01:11 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.kernel.org (Postfix) with ESMTP id 55A35C4CED2;
	Mon,  4 Nov 2024 09:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55A35C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aIFOG
	sqEil/CZqwfy0ewPkNvhV31ePBcClT4E1DSKDw=; b=Hy3jQy+VOTyMsA3Hcxfm1
	ORovaENGXHd3E7tV/etgx7o/z1bkCAqDQR6NW9MSJcFqYz8kEoJwWtJAobonHDlQ
	Py3jMR0d3mavafy5/y6LdzbHRwfgteBLrVJa8jOpJmn8kNXOgIbGUHAxvv+ICchU
	inT76/lNDp/LsnFwQixgds=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S7;
	Mon, 04 Nov 2024 17:01:03 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig changes for 6.13
Date: Mon,  4 Nov 2024 17:00:55 +0800
Message-Id: <20241104090055.1881860-6-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104090055.1881860-1-shawnguo2@yeah.net>
References: <20241104090055.1881860-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXD75LjShnSBmkAQ--.16437S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5ury8Zr1xJr4DGw43Awb_yoWfKwc_AF
	yxJ3WUGr4UJryDGF1xZ3WxZr4UKw17JFy5Zw1UtrW3uF1ayr1jy34UXrWfZr1DX3WkJrsr
	ArWDJw1DAr17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8sXo7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxGNZWcoYr+P7gAAsB

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.13

for you to fetch changes up to 0fd75ba1750318cd824713d43f2480159c2a54aa:

  ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E (2024-11-04 15:15:57 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.13:

- Enable BD71828 regulator and NXPUART Bluetooth driver support in
  imx_v6_v7_defconfig (needed by Kobo Clara 2E device)

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

