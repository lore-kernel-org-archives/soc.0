Return-Path: <SRS0=iCEH=RB=norik.com=andrej.picej@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05036C433F5
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 07:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3CC0C36AE2; Thu, 16 Dec 2021 07:13:29 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCDDEC36AE4;
	Thu, 16 Dec 2021 07:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCDDEC36AE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oYwDBiRb4bnsLIdysL1aQuKoYF83yeKM17oGZryG7mA=; b=QTXTW9e1KLzofVzxQd6BYjwdan
	jiBHD0HZT+XU3FrXlsRSVqVElp6Gn+yl3BjJu1V+qmfC6pjzGw2WRanLpYxuGjhHRC6yHZp52NeDs
	pUmot6Bb2KJLl96Z5o6xJrJ8kRVOU1wRS6gFIEqMTD9p5hcsowALznNalQrl4MAyybyHkizQbvigv
	PzHCp21GLBU+Z+ejXIpaosI5VSBewbISSwIlYGXqr98EFc9pl1kMIPAPdYu6rrdiHkiz/R2rsciPc
	DDtfIvbE7MHjBDL1Its3ZBLiUK5ZRAhTnSb/G9LhXRivGkTAxV3RfhPuJOFnA21p/2hv2VKlDhsjh
	G4/ECfzA==;
Received: from [89.212.21.243] (port=45054 helo=[192.168.69.215])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1mxkwv-00GVL1-1x; Thu, 16 Dec 2021 08:13:16 +0100
Subject: Re: [PATCH 0/4] PHYTEC i.MX 6UL/ULL devicetree patches
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Oleksij Rempel <linux@rempel-privat.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Yunus Bas <y.bas@phytec.de>
References: <20211201125327.3704500-1-andrej.picej@norik.com>
 <CAK8P3a30OQ9AUSU2p4X3R90GwEOLLY3h4Vj78Tr01JKb2NLZHA@mail.gmail.com>
From: Andrej Picej <andrej.picej@norik.com>
Message-ID: <eda3b3c1-cd46-5f37-0fed-7f266e7df3d2@norik.com>
Date: Thu, 16 Dec 2021 08:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a30OQ9AUSU2p4X3R90GwEOLLY3h4Vj78Tr01JKb2NLZHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 13. 12. 21 17:13, Arnd Bergmann wrote:
> Hi Andrej,
> 
> We don't normally merge board specific changes directly into the SoC
> tree, please
> resend to the i.MX maintainers. You can keep the rest of the Cc list except for
> soc@kernel.org.
> 
> As a general rule, try to make the "To:" address of the patch series the person
> that you expect to act on it, either reviewing or applying.
> 
>          Arnd
> 

Hi Arnd,

sorry for late reply and thanks for this information.
I will resend the patch series and change the a addresses.

Best regards,
Andrej
