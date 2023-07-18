Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4E7EB64DA
	for <soc@archiver.kernel.org>; Tue, 18 Jul 2023 10:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83FADC433C9; Tue, 18 Jul 2023 10:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB71C433C8;
	Tue, 18 Jul 2023 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689677990;
	bh=KqDh0PeRVpplOpGAvCvvkOXZEl5vZm+yis2Ydzu0jNI=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=dQJQ7iWMOwL1hurMPTPxWAWgPWtBrdm8/Z3OHJQZi7yVPK4ejYjZszuXWQmfjrnOX
	 CvIKZB7veBS2JpMqkCea+12q2gBNZVSAmowWFzVaB/TpHArYXf0kBrXKhLIPsFpIyk
	 YxTow4a7iSLJJPB4WtNRYabsESj04itffaQMbZRAXOWF/SCsUznIRmUDwM61ZDnm4U
	 60xONyClLbMQpgsk5kHSAxexqpF47JsIXhSoRlCS0KAI7+APFHrmcJOw0eVHpJ0FHa
	 /A1sZFTfawFOh426mpjnu2XmXjyn23SJYbTM1IC8S8bkHwIY7bBSqEhOa3D7cLXDCw
	 i1S5uGTsiuUsw==
Message-ID: <c71ae185-d0e8-75df-1d4b-caab4bdc95a7@kernel.org>
Date: Tue, 18 Jul 2023 12:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
Content-Language: en-US
To: "lihuisong (C)" <lihuisong@huawei.com>, "xuwei (O)" <xuwei5@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@kernel.org, wanghuiqiang@huawei.com,
 tanxiaofei@huawei.com, liuyonglong@huawei.com, andersson@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 shawnguo@kernel.org, arnd@arndb.de, sudeep.holla@arm.com,
 linux-arm-kernel@lists.infradead.org
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230530112746.2767-1-lihuisong@huawei.com>
 <02f74b25-2ade-5b87-b316-ab902f08ead2@huawei.com>
 <3e106062-9ceb-eb51-70ba-32734c769bd5@kernel.org>
 <2cc391ce-0e87-040f-6a45-d3e128a988f0@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <2cc391ce-0e87-040f-6a45-d3e128a988f0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2023 10:07, lihuisong (C) wrote:
> Hi Krzysztof,
> 
> Thank you for your reply.
> 
> 
> 在 2023/7/17 20:06, Krzysztof Kozlowski 写道:
>> On 14/07/2023 08:17, lihuisong (C) wrote:
>>> Hi all,
>>>
>>> Can you take a look at this series?
>> People you listed in "To:" field are not maintainers of HiSilicon, so
>> why pinging us?
> This "To:" field are from the get_maintainer.pl script.
> ./scripts/get_maintainer.pl -f ./drivers/soc/

Which is not really correct. Why would you send it to maintainers of
Samsung or NXP?

> The hisilicon in drivers/soc/ is created for the first time. So there 
> are no maintainer of HiSilicon.

There are. Open MAINTAINERS file, use search and voila.

> 
> Thanks for reminder.
> add HiSilicon SOC maintainer Wei Xu.
>>
>> HiSilicon DTS has numerous issues, so if you want to increase the
>> chances anyone cares about your patch, please contribute to fixing and
>> improving your company DTS. See for example commit b2bbc8687 which is
>> bad (underscores are not allowed) or 1860a51823 which is just wrong. The
>> latter one is being fixed, although I do not see the fix being picked
>> up... my feelings are the platform is just dead.
> The HCCS driver has nothing to do with HiSilicon DTS.
> So I cannot understand why you say DTS.

I grunted about poor support for HiSilicon. Because both - HiSilicon DTS
and HiSilicon SoC HCCS driver - are for HiSilicon.

Now, why don't you help the maintainers review/fix stuff so they will
have more time for your patch?

Best regards,
Krzysztof

