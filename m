Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2B3C433F5
	for <soc@archiver.kernel.org>; Sat, 12 Mar 2022 19:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C75D5C340F4; Sat, 12 Mar 2022 19:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BE6C340EB;
	Sat, 12 Mar 2022 19:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647112170;
	bh=z25txTGe2NW9biP6xU9Ov3loRdeXTKWEbLeexkV9B/s=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=jgon5pEceIQqVQTD2eXz59noJ4wXR2/0LsDhKQ7Wk6ucI5Phyvd/m085TzLju9wH5
	 Et2R5Acrpn77sgOQqK4hFR+1d+/eANfiVugAm+ZpSUQ+REpW902onQsqOPYaf52S5Q
	 2LU4g2OD1dFN/nXxPBqfZHWeP9XBXAxBz2t29lc1xjxrqshq8bXs6ecZUrxksWmYaE
	 P/jO4FqPUokNjtRVHPAEcWoUmgkTOZDZJ43FUUa6yXwv9iknGq7Y2dAE/VPNV3wsgq
	 Vd5Sg7Nlkx9pdbd55UqyCOV9tL72EjttF1Y32zssL/bellGW4qoGRJpCq9V1FdjG2O
	 QSDATOjSTz4Mg==
Message-ID: <5d310847-3ef9-d758-1c87-ec6be170bb10@kernel.org>
Date: Sat, 12 Mar 2022 13:09:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL 1/2] arm64: dts: socfpga: dts updates for v5.18, part 2
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
References: <20220310195740.151250-1-dinguyen@kernel.org>
 <CAK8P3a3E9Ch6BspdxZ6FPU9kpSGg+yECVDu+WRwgh1f8Hyvrgg@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAK8P3a3E9Ch6BspdxZ6FPU9kpSGg+yECVDu+WRwgh1f8Hyvrgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/22 04:29, Arnd Bergmann wrote:
> On Thu, Mar 10, 2022 at 8:57 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
>>
>> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
>>
>>    Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>>
>> are available in the Git repository at:
>>
>>    git@gitolite.kernel.org:pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.18_part2
> 
> I've pulled both manually, but note that these should be public
> https:// addresses
> instead of the addresses you for pushing. You can configure a "pushurl" in your
> .git/config.
> 
>         Arnd

Sorry for that mistake! Thanks for the pull!

Dinh
