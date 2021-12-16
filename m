Return-Path: <SRS0=iCEH=RB=norik.com=andrej.picej@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02BBC433F5
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 08:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C409BC36AE5; Thu, 16 Dec 2021 08:45:22 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DC7FC36AE2;
	Thu, 16 Dec 2021 08:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4DC7FC36AE2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3uCWttw4dMS56bfbOmnNG/N1QPhPOwZOcgZviHGmbT0=; b=Wvdn1V2D5DsdPO5khDtpxbu6ox
	IvvYdVADELouYbOEAhKuxWrSlzsC6tlZxWQGBKu2JQEAA6Xhe9opfW/BdZkFIhqoZ2IQr6/4dlis7
	hl8ANYJfdIv8AQDMz3vxv8t7QNjjH6liNdwq2zDk5NVx7SXxNAISS2oWGqPt6C8otQC66L8dpmhY5
	xjw5c4PpCZU2tnSBafCnQmfmXv12cGHF1c7G/M4iMHwHm0pYa8THe8l+6pcftbToBKQ6ysIHfwwBX
	/ooFfcOCz4Ji/tA0iTyCGygwPj6d6oDNjZQD3XT6UyaBEuuFHPyJcFkWl0BWYzZYJH7HR/XC9HxFD
	005pAilg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46774 helo=[192.168.69.215])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1mxmNw-00Gi92-K6; Thu, 16 Dec 2021 09:45:15 +0100
Subject: Re: [PATCH 1/4] dt-bindings: arm: fsl: add PHYTEC phyGATE Tauri i.MX6
 ULL
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 leoyang.li@nxp.com, krzysztof.kozlowski@canonical.com,
 linux@rempel-privat.de, festevam@gmail.com, arnd@arndb.de,
 linux-imx@nxp.com, y.bas@phytec.de
References: <20211201125327.3704500-1-andrej.picej@norik.com>
 <20211201125327.3704500-2-andrej.picej@norik.com>
 <Ybeb5I/mP3JFrDsQ@robh.at.kernel.org>
From: Andrej Picej <andrej.picej@norik.com>
Message-ID: <698c247b-ba61-765b-9572-9181d1e141b8@norik.com>
Date: Thu, 16 Dec 2021 09:45:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ybeb5I/mP3JFrDsQ@robh.at.kernel.org>
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

Hi Rob,

On 13. 12. 21 20:15, Rob Herring wrote:
> On Wed, Dec 01, 2021 at 01:53:24PM +0100, Andrej Picej wrote:
>> Add devicetree bindings for phyGATE Tauri board with phyCORE-i.MX6 ULL.
>>
>> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
>> ---
>>   Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>> index 0b595b26061f..9c37f22b6c61 100644
>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>> @@ -602,6 +602,15 @@ properties:
>>             - const: phytec,imx6ull-pcl063  # PHYTEC phyCORE-i.MX 6ULL
>>             - const: fsl,imx6ull
>>   
>> +      - description: i.MX6ULL PHYTEC phyGATE-Tauri
>> +        items:
>> +          - enum:
>> +              - phytec,imx6ull-phygate-tauri-emmc
>> +              - phytec,imx6ull-phygate-tauri-nand
>> +          - const: phytec,imx6ull-phygate-tauri # PHYTEC phyGATE-Tauri with i.MX6 ULL
> 
> Is there really a need for 2 compatibles here? Either
> phytec,imx6ull-phygate-tauri is specific enough (as nand/emmc can be
> described elsewhere) or you need
> phytec,imx6ull-phygate-tauri-emmc/phytec,imx6ull-phygate-tauri-nand.

sorry for late reply. Yes, I think we need both. We have two board types 
for Tauri, one with eMMC and the other with NAND. Depending on this the 
NAND or eMMC gets enabled. The same logic is already used with other 
PHYTEC boards (e.g. Segin and Mira). Or did you had something other in mind?
> 
> 
>> +          - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
>> +          - const: fsl,imx6ull
>> +
>>         - description: i.MX6ULL Boards with Toradex Colibri iMX6ULL Modules
>>           items:
>>             - enum:
>> -- 
>> 2.25.1
>>
>>
