Return-Path: <SRS0=LAtt=VS=foss.arm.com=carsten.haitzler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8E4C433EF
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 12:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8068C385C9; Tue, 10 May 2022 12:42:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 94AE2C385A6
	for <soc@kernel.org>; Tue, 10 May 2022 12:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94AE2C385A6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B53E11FB;
	Tue, 10 May 2022 05:42:37 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99DFF3F66F;
	Tue, 10 May 2022 05:42:36 -0700 (PDT)
Message-ID: <199b8faf-71a7-e954-cec0-229d46d4cef0@foss.arm.com>
Date: Tue, 10 May 2022 13:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20220427114200.111904-1-carsten.haitzler@foss.arm.com>
 <CAK8P3a2dx+qV_LmbtveD8kEi9LhRSXBvgQ-a63bRcXB=niGOfg@mail.gmail.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <CAK8P3a2dx+qV_LmbtveD8kEi9LhRSXBvgQ-a63bRcXB=niGOfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/9/22 15:34, Arnd Bergmann wrote:
> On Wed, Apr 27, 2022 at 1:42 PM <carsten.haitzler@foss.arm.com> wrote:
>>
>> Key devices that support displays on SoCs like the Komeda DRM driver, the
>> older HDLCD were not enabled by default and should be so displays can work
>> out of the box on defconfig. Also Candence I2C support should be enabled so
>> the PHY and thus displays can work too.
>>
>> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> I applied this patch on Apr 27 after you first sent it. There is normally an
> automated confirmation email after it gets uploaded, but I think this did not
> happen here because there was a small context mismatch -- the patch
> still applied but patchwork did not detect it.

Aaaah cool. Sorry - I was hunting it down in git trees and didn't find 
it... never mind the follow-on mails then. :)
