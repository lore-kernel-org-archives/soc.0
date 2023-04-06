Return-Path: <SRS0=Fn9z=75=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5819C76196
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 06:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A29E1C4339E; Thu,  6 Apr 2023 06:57:22 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6338CC433EF;
	Thu,  6 Apr 2023 06:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6338CC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N49Qd-1qScX81GuP-0103xM; Thu, 06 Apr 2023 08:57:03 +0200
Message-ID: <ea67b952-d94b-d7c4-e4d4-0e8d9daf1f08@i2se.com>
Date: Thu, 6 Apr 2023 08:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V5 4/6] dt-bindings: ARM: fsl: Add chargebyte Tarragon
To: Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <stefan.wahren@chargebyte.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-5-stefan.wahren@chargebyte.com>
 <20230406014631.GL11367@dragon>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230406014631.GL11367@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7QEkdBBfrMm1kmrS/aM6oJhq4ReuMUZBV54BqCVhP63oqsJggRI
 5+Zda+zQP5N5E1XHUPCyEI+PJtL9h4zCWezkLBuP6wGnGNOrFK28REeo0VYS5I5UMt4hwPQ
 7cbWLDaC9RCNSRoHoQulPGzjiwCNxc2JAoWO1myG9CYq9rW5XDPAE53pzvSjNwhs1C5x5dr
 M1rM9h8ntf97MonMI/HGQ==
UI-OutboundReport: notjunk:1;M01:P0:9NXzCW9wF3c=;VJtVKcK+H5GvzAcvPMSPnbqPtdN
 rSsJq8A0FY5aeMSBaqraU06aA/Wtto3uGXxnh132+fzD7PLvw3oWYwYfpLjWpXdeLchRQ/E8n
 8P2euYvLpbbei3KFl18A3wXfPYYiMnohHyLcbHOE+VksERa0v2FfvXOmIhh0xyAAeglPaBqRm
 kZOYOteEmwxoowA31W05U4CXtF1sVShAbbaF52Q6kz1eoyQ+iGdzydd1lbqi9la+B+9F60G8h
 IFyVGbWQVYa0jcncpIRcAsHXVZKU2ALZXUVOHhrfdfkdXLOl5C8enNIP1x05jCMf9WSWq44+V
 +auFhxik2sX+VvsSrPubklUds1vt77DyGMCctqBN+SywttAhDsMb5AcuKkNNm3Dq5npsaF7CV
 RkxKvTU0oo+Ym0sYHTjgQwdpHLkokOki/Q6G5BJ/UOzCiuy84oC0xcQPA85OI+XUAQpbsvN6R
 7mqic9Tt+U8U2ggcH6tNFuVmOqm435SsyqbQMEeVA/xf+Ru0oYiLhAJk5Ido/t/MHRSMxZrf2
 G3Xg2ECoOE8RE7036c2uK0ZhldMlF1U9MQRqDLUg24iDHQmB+P58V9IXwxk+3izDjCOMvSgah
 DiBvoFnQaY+lf0GTymlmyBNUmbF3XW2//J3WLCKZmLKZGI4u6i6cUFaDlsmc8GJ315RXPiP7s
 6Gne6eXsxQpVlZjmtBPmVLSwVvRGSDab8YugXiWVEg==

Hi,

Am 06.04.23 um 03:46 schrieb Shawn Guo:
> On Tue, Apr 04, 2023 at 10:02:41AM +0200, Stefan Wahren wrote:
>> This adds the compatibles for the chargebyte Tarragon boards.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Applied 4 ~ 6, thanks!

thanks a lot.

What happens to patch 2 & 3?

Who take care of them?
