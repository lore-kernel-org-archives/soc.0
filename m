Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AF4C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 21:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F02FFC340EF; Tue,  8 Feb 2022 21:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA86C004E1;
	Tue,  8 Feb 2022 21:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644357290;
	bh=95fKco2cFZ/RK0FCWXP859MZZoZZWIMag8lrvV1+nYE=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=WVjqbeVI1akWoyCd510/JyrQtkNvcTLQZeckArT1GvgOT8krQOBaD9M0RrWzlAV4s
	 KYKkCq14jahe9anp08YyE+wWj9euB5mw8+RXNkyChmRJ0npwEyQuqAGcuK47FI7dcU
	 zowyduA70Teek90j4+Bhq1zr3eAVyNUuaHoYkfdeIVCjdTZJmzWaecpSVfF6IfQXRc
	 DD4lNOnZW7KYDzFQXqhSLFc7zLdKwuTh5DND4+0aCzKukws63XH5bS4nmFpD3+P6cJ
	 wyTT1aJ4k0Sy6excOXHxvG2p9OBC5AR3f8WoyTOwi+Mvv6Ld1atxRfTWiI/sf3ETQZ
	 jbhmyj1Rj9QOA==
Message-ID: <3d106a06-0361-45c1-bc81-48da0b1bc5f9@kernel.org>
Date: Tue, 8 Feb 2022 15:54:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] arm64: dts: socfpga: dts updates for v5.17, part 2
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
References: <20220105213603.804026-1-dinguyen@kernel.org>
 <CAK8P3a0A5tDUKpFaRUJku97ui+EpYO8NoomyrAXg==GugBxQbQ@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAK8P3a0A5tDUKpFaRUJku97ui+EpYO8NoomyrAXg==GugBxQbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/8/22 04:15, Arnd Bergmann wrote:
> On Wed, Jan 5, 2022 at 10:36 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
>>
>> The following changes since commit 8dce88fe80a858f34bb5b46470218fe478d251ee:
>>
>>    arm64: dts: Update NAND MTD partition for Agilex and Stratix 10 (2021-12-01 08:07:41 -0600)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.17_part2
>>
>> for you to fetch changes up to 0020e9e1f8d3348dd5c9a37612b1089c1a47553d:
>>
>>    arm64: dts: agilex: align mmc node names with dtschema (2021-12-29 04:57:47 -0600)
>>
>> ----------------------------------------------------------------
>> SoCFPGA dts updates for v5.17, part 2
>> - Cleanup of Altera/Intel ARMv7 and ARMv8 DTS and bindings
>>
> 
> Hi Dinh and Krzysztof,
> 
> This branch was one of the things that ended up not making it into
> the merge window, and I have now dropped it from our for-next branch
> as I'm adding 5.18 contents, sorry about the mistake on our end.
> 
> I think everything still applies cleanly and nothing in here is urgently
> needed in 5.17, so I can just merge the pull request again for the
> next merge window if you prefer. If you have additional socfpga
> material for 5.18 or some of the patches should go into the fixes
> branch after all, please send an updated pull request instead.
> 

I have a few more patches for 5.18, let me send an updated pull request 
that will include these and the new patches.

Thanks,
Dinh
