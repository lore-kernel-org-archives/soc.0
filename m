Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7A3C9888
	for <soc@lists.linux.dev>; Fri, 31 Jul 2026 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485747; cv=pass; b=nD3+yfZRcXCz+TfLLTbibmUKkM6/OLskQyrJfwx/OaUC3Hq6jK/jmCUnaFJB003R7ozIbwNyDoyAdXyasJnoT8BYmQwc+C2YbUDLOg4jU44GS+Mx6jXmKMatXaIPo0ufoM21pGJyV2YhBi2AFfxXW2t4G9TJIbE6QCc0PWFmKdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485747; c=relaxed/simple;
	bh=eEloiSXgCbSzn+8eB9Hi1bIXN5vK1UhRnzGJovkszYc=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=ATWYQhJNdNX/SW3ATgUwBTTX8IDOzFlQVvjEQrb7PFu7rBof75tOTBIt2x8ZbZGpDTlH3BJuz6H1Vp0IxtithIzsaLxsgs1krZxXYMMc1TgP95+nGQQtXWdsAEH1pnPFRZOB+pLp/kf1MGJZM+B1Cda7RYgXoZ0cNqlJba4lNWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6NkYvgWi; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6NkYvgWi"
Received: by smtp.kernel.org (Postfix)
	id 9EC0E1F00A3F; Fri, 31 Jul 2026 08:15:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785485736;
	b=VDHoQgSqueCdwXLqdPYE1T15NE6lKkKEj3Svm5DHZkKDS2uAbkIyNjPVd3Ry9GaVN4Aa
	 HyDMVdwhLFFvpaxAEsfT1cDHSQLLow65Pf8qI2fMMlJo0uM09H3YC52EIDIAyRcbXHFdC
	 HRNRcACoTMEpnprPKZr3qOXbKdlxT0FxgtixtYQ4wwwPQokuhLqAANxVF/F01DdCfW+Mi
	 1iO6sNMrGNuvdGk+qfJIkEhCo/6zR6LOHOALCYo+98x9755H47cA+ePIdxmBcZjkcPy9p
	 8OGzyrI2Ptl1xe3UCUDiUc9mXmkWASgAamOAVFRxkOEgiDenflmK2tS2KHMN8rKiUgg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785485736;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:
	 Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=OWyILn+Pp++L/PxP5JfzjsB6Yv2M6go0TZoxaEbhatE=;
	b=Xe1Zd3c+ksyAuzns3Yq5aufppbXNx4Pdd4wmo/N/lHot46u5vrNyLF04Ab64yTRlU89n
	 /AKAOwZlHWtMf7NB5iSAU5g3jRBZOM760h/i1/BgQzf0k0/NIaL0fRvPLoUNlnvIahMtH
	 n8Ls4SCc2T3xn8jvRA5zKYHJj/wk+SOO+DZ+MJmaJ6qsvBdQ69Po78h6I04VPpvKy9rMZ
	 r/LQua4homp2O49D4YnvJslvYazGatRO78oKfeIR5ONfT1HMUBiQjwJvsocjXwAPBzMC+
	 WgwTsC1dXOni5YcIr1+ySeMuWmejje+W0NprpzEBMQb9P8K/nYkzqUNkJkIs3RwFgQg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6NkYvgWi;
	dmarc=fail header.from=hisilicon.com;
	spf=pass smtp.mailfrom=huawei.com;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F7F31F000E9;
	Fri, 31 Jul 2026 08:15:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6NkYvgWi
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1F7F31F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OWyILn+Pp++L/PxP5JfzjsB6Yv2M6go0TZoxaEbhatE=;
	b=6NkYvgWiBBt3oOaTaDoB/5YnfR/8KwrUlWxvdEylYHdxKszq2LxGaTuYie88GWrMd1H25YOia
	AZpY4qPjj0fAA5pMdae7ubmFK/ZkSgQ2K9BJlA72Xp/MnKCSjrBwBYfr2C4/U41ZwT2FiygN9xU
	REontTjBql3AnczEnsApklA=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hBJY53wkbzLlXZ;
	Fri, 31 Jul 2026 16:06:01 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C22854057C;
	Fri, 31 Jul 2026 16:15:29 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 31 Jul 2026 16:15:29 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 31 Jul 2026 16:15:28 +0800
Message-ID: <6A6C59A0.4070501@hisilicon.com>
Date: Fri, 31 Jul 2026 16:15:28 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: <soc@kernel.org>, <arm@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	<xuwei5@hisilicon.com>, <zhangyi.ac@huawei.com>, "Wuliebao (Joab, Turing
 Solution)" <wuliebao@huawei.com>, "Shenqingchun(DanielShen)"
	<daniel.shen@huawei.com>, <huangdaode@huawei.com>, <liguozhu@hisilicon.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.3
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-7.3

for you to fetch changes up to 73ff3f98b8ab7630977ab6de2ce672918da8e774:

  arm64: dts: hisilicon: Correct indentation (2026-07-07 17:00:14 +0800)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v7.3

- Correct indentation
- Drop unused clock-names and reset-names to fix warnings

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: hisilicon: hi3798cv200: Drop unused clock-names and reset-names
      arm64: dts: hisilicon: Correct indentation

 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi |  4 ----
 arch/arm64/boot/dts/hisilicon/hip05.dtsi       | 14 +++++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)
