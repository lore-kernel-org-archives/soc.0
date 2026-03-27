Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FEB34F244
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774595797; cv=none; b=KSY6qH0FYPMWLhChj9sNJkpwUuFR/f5EGZw5n9rzeNTTGlCtZIP+Z2juRMRnwQoCOFQSJuHjUxeAWeo7s3KTAsEh1MQEJNv83p3TLNu2Znwrbhwj/uJ8abySqv6dB/auvxcHbT/kEL+gJQ0FcfQ/I2JWMlfoyZ2eY1lQc7kHpCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774595797; c=relaxed/simple;
	bh=UGYbqFeAf35A4/cpxVTElO4hir4aE55xPh3I6ha14rw=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=IF36cIC/T6GOumAB+8i2sHhOB9X23WlxWE1T9nIVgFknvcOb2VNUNOVwNB6g+t8fgGgEi9wDwytow3y7oEPmqwo8li8yjY06YoNY7GpiXVZn84NklnEITADd26NqzV3XKQ2cp4QFzz5hVK5qY5guTWG66XT7VEmXdXkYuYZI0OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=JcvWvuzl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="JcvWvuzl"
Received: by smtp.kernel.org (Postfix)
	id 21553C19424; Fri, 27 Mar 2026 07:16:36 +0000 (UTC)
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78664C19423;
	Fri, 27 Mar 2026 07:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78664C19423
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yyqVda/JjNdjXtcLyeju+CukF5PpQZ3xDxa4b/RlBfk=;
	b=JcvWvuzlTpohpEirVMRGhHQix+JYpp73W5ctgk2L4oUqcRpHiMqnWDtg/9qewc+DKs8yFDRM5
	JSHPoKhenyjtkZaxIoVXDSxixrtW1YVdmjGelBEOm3FvEfNjWKVbs7flmFZobFTf6KmYC8dnCc1
	YdrW8Gw2xTntERnm4FKAcF8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fhsHd6wBtz1T4Fv;
	Fri, 27 Mar 2026 15:10:53 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id B5D5F40571;
	Fri, 27 Mar 2026 15:16:27 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 15:16:11 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Mar 2026 15:16:11 +0800
Message-ID: <69C62EBA.6000608@hisilicon.com>
Date: Fri, 27 Mar 2026 15:16:10 +0800
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
	"Zengtao (B)" <prime.zeng@hisilicon.com>, "lihuisong (C)"
	<lihuisong@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	<shiju.jose@huawei.com>, <salil.mehta@huawei.com>
Subject: [GIT,PULL] hisilicon: driver updates for v7.1
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-drivers-for-7.1

for you to fetch changes up to a8f5c98517c7c89947024f79e5854e6b09766b79:

  soc: hisilicon: kunpeng_hccs: Remove unused input parameter (2026-03-21 03:55:35 +0000)

----------------------------------------------------------------
HiSilicon driver updates for v7.1

- Fix two compiler warnings on kunpeng_hccs driver

----------------------------------------------------------------
Huisong Li (2):
      soc: hisilicon: kunpeng_hccs: Fix discard ‘const’ qualifier compiling warning
      soc: hisilicon: kunpeng_hccs: Remove unused input parameter

 drivers/soc/hisilicon/kunpeng_hccs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
