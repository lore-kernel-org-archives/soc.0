Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0823CF665
	for <soc@lists.linux.dev>; Fri,  5 Jun 2026 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648581; cv=pass; b=C3ApaIOD30uwQv6aJlNERZLHXDBbJmvgBFKCcyASVya23WssxYAW52Izimu/EhbDpYbxDHB2SKsuA67ap2bpI0gyFbWgx55f0eCjb6g7JfZQJZ7f8NwVB3jy0/SfcHMuc9uyn9K6U0luXFoYhNbt8+x9o+F4rkNRHEcCpE4ksEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648581; c=relaxed/simple;
	bh=dHLIVVmdEnfs6WUsEAgxZfYepx1fI1w33if2ybxYCyU=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:Content-Type; b=cjTBDYoLmlCjVtLk7qMGApRqoug6gFC720lY8WCtGp+CPEt3KQHmGxEnLbnDejFfJ75vQIL7f9WymCiGeANPcPGy1AOic//lGwKBrfjhsAh9hhfIlICoIKv5bJepWP3TcwkgeVCxZbLnwvTKXbcRzfgijzxUEiV7mWWpAmDFeC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1Z6eLHqL; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1Z6eLHqL; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1Z6eLHqL";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1Z6eLHqL"
Received: by smtp.kernel.org (Postfix)
	id 995471F00893; Fri,  5 Jun 2026 08:36:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780648578;
	b=ssl7QEJc/MG8nIUpYErg8AuESYZyVDka+OxTldhGNVlrYfpMWgy79MWx7UlpE8xyHcxT
	 iR+Od/fpKyCVapNNh24eRa/Ec72OUD1zJ8WlnEOj80MkGEzV16qzElD0HQIZb4lo5C+rP
	 E1m9gSP1Shk7/t64ZCCGaqGEOx8vDOs68ivEL0DVgWXTSKmo+XhPJhkJSkcc1fTN+HKdM
	 ETKML9AernFUTcSbbZFwGF4z345hJLK/KEhDDcmaIJkift/IdYnd5pPVdzIUPXcFivKVp
	 +QpLR9l79pP+v6intYTZMr2CKxMxyPCsyvgIHecmmQeiJr2da8rZfZao1gNCqN3a3rg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780648578;
	h=DMARC-Filter:dkim-signature:Received:dkim-signature:Received:
	 Received:Received:Received:Message-ID:Date:From:User-Agent:
	 MIME-Version:To:CC:Subject:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=OX8DgfWF30QEwxNEMg3rfeDEk29FdACgJkomvM/mw7I=;
	b=KDWOIr4uXFfqsQnuFWTR3tWFgw3WQRtg3xHuksL3OT5I3KG0OHQFFdmVkdU5DAy7kzSW
	 jYCHv0nuTnfijUAJwf8KMLnsmq6esZK38mz7YvFT8qd/+nZS9LYa/0Wd00GSO0nNrGmQb
	 4nqah8Gjlo6pOOmBlONMCMxbD8DcxxtpsgiZxINlHytfIga0zTO0f8rXvHZEnjnRwO4cN
	 muZWKFwlrALew+qkex9ytIex/J8QXm9VIAW3vXtmlBoph4NfvqkfVvPg7+JSeAXLISrK+
	 4cWRq5+RX3DfcCVQQR+L04a5VYUqsuRX4pUP5Tk/oNRqw5PgTXszEPW+f73h+ldza7g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1Z6eLHqL;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1Z6eLHqL;
	dmarc=fail header.from=hisilicon.com;
	spf=pass smtp.mailfrom=huawei.com;
	arc=none smtp.remote-ip=45.249.212.187
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DA3D1F00898;
	Fri,  5 Jun 2026 08:36:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1Z6eLHqL;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1Z6eLHqL
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7DA3D1F00898
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OX8DgfWF30QEwxNEMg3rfeDEk29FdACgJkomvM/mw7I=;
	b=1Z6eLHqLo8i5hGoDClzEjbV2FpLGfRzbkqAwmUIwmT9uzD92KtEUxqu2rafEfC1JEUUYhIHh8
	3rXiu6xHpLklj/7fo+h5BA9eDRSeDs22uL+5zL64C9od40r7qt/T42x36QdbU3dhllPwNSNGaRA
	zioyY4c2jA+KjnT7LeeJDAg=
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gWvsb5gHRz1BGjR;
	Fri,  5 Jun 2026 16:36:03 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OX8DgfWF30QEwxNEMg3rfeDEk29FdACgJkomvM/mw7I=;
	b=1Z6eLHqLo8i5hGoDClzEjbV2FpLGfRzbkqAwmUIwmT9uzD92KtEUxqu2rafEfC1JEUUYhIHh8
	3rXiu6xHpLklj/7fo+h5BA9eDRSeDs22uL+5zL64C9od40r7qt/T42x36QdbU3dhllPwNSNGaRA
	zioyY4c2jA+KjnT7LeeJDAg=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gWvhg1QHjzpSv8;
	Fri,  5 Jun 2026 16:28:19 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 1FC374056D;
	Fri,  5 Jun 2026 16:36:01 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 5 Jun 2026 16:36:00 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 5 Jun 2026 16:36:00 +0800
Message-ID: <6A228A6F.7010502@hisilicon.com>
Date: Fri, 5 Jun 2026 16:35:59 +0800
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
	"Zengtao (B)" <prime.zeng@hisilicon.com>, Akash Sukhavasi
	<akash.sukhavasi@gmail.com>
Subject: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.2
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi ARM SoC maintainers,

Please consider to pull the following changes.
Thanks!

Best Regards,
Wei

---

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/hisilicon/linux-hisi.git tags/hisi-arm64-dt-for-7.2

for you to fetch changes up to b54fcf7a2df1124a21195afde508369e47067a1f:

  arm64: dts: hisilicon: hi3660-hikey960: move role-switch endpoint into connector (2026-06-04 15:23:27 +0800)

----------------------------------------------------------------
ARM64: DT: HiSilicon ARM64 DT updates for v7.2

- Move role-switch endpoint into connector on hi3660-hikey960

----------------------------------------------------------------
Akash Sukhavasi (1):
      arm64: dts: hisilicon: hi3660-hikey960: move role-switch endpoint into connector

 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)
