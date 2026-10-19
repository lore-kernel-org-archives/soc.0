Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA0A4E3230
	for <soc@lists.linux.dev>; Mon, 19 Oct 2026 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416078; cv=none; b=tjCWUmdQnwdf8GV1MqszkvhJRIBiODAtA5gKqJ11PHZS+qJvP1TjHTDlzvYAF1CYTzY5oho4Y/LA/eP1akLb8YL7hnQYTViONN/QHbtXkC9RjmV/Uf6P5A5k3BT0zvRY1fiK3gn/2oxuT1Afst0Jpgt77MDTtoO5tpqWhTiKmiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416078; c=relaxed/simple;
	bh=JHwT4rUZxcIOoaz10BeQzkwU5sZ39+aXArqWxYEqr6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mwn5eejFLsRvKr+B69J8gfQMMw6S0KA65A0nphkkKnhEMiCFXhtZgyEh+fc7X7wpqpvrXXIxVyAziYl9u6g6gP+Yx3Mc9Yj7ln+WO/UX1/2VQ7dAiC2mP2iRWcH/TpojxgClHQ9W+d/8fQhHbAcJLwTRXaCCdaCI+2NcyQ8t1Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiggoGU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiggoGU2"
Received: by smtp.kernel.org (Postfix)
	id 98E311F000C8; Mon, 19 Oct 2026 13:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519011F000C7;
	Mon, 19 Oct 2026 13:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792416077;
	bh=nOtO4gipd4jKMwHsKpIK4WQhKoh3Kd3Nni2aiG3wCyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XiggoGU2exWFm6Gx1osWhY6WbqnwuZmGsAlhF86rBHUVVC7vC4vThhj05WjQRjVlE
	 06OxHzt5PngmGffqGf83bn+JctLvADvskZCA5iBKXITOKV+vFHyL2CrJ23h+k766wT
	 ncur0/3+xh+c7CR/qDtmgAOpORro5UAgev2+wp83gFwCCyruzbVFKQXuhs49BKe3c+
	 KXRnrIhg1GAOC4mS/u6h/GYUIszYgvguLFkdVju5f93sgXaYBFwFD6AUfcYO/XLwnU
	 5vX1SyaUSAvwaXjLMR8lugXQjUDg2i2z4gpXedt+n0+fPUD6AP8Flh07svu3EOASA3
	 OtqaobqW2Fk5w==
Message-ID: <2a568553-b3b5-4072-9313-a8f63d3541a5@kernel.org>
Date: Mon, 19 Oct 2026 08:21:16 -0500
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org
References: <20261008164735.566333-1-dinguyen@kernel.org>
 <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
 <e47367d1-9c46-43fe-b657-28358def2804@kernel.org>
 <93418744-ba09-4031-b96b-24fea70d4cb8@app.fastmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <93418744-ba09-4031-b96b-24fea70d4cb8@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/14/26 02:06, Arnd Bergmann wrote:
> On Wed, Oct 14, 2026, at 01:33, Dinh Nguyen wrote:
>> Hi Arnd,
>>
>> On 10/13/26 11:10, patchwork-bot+linux-soc@kernel.org wrote:
>>>     - [GIT,PULL,1/2] SoCFPGA DTS updates for v7.4
>>>       (no matching commit)
>>
>> I see that the bot has pull in the 2/2 of PR, but something may have
>> gone wrong with the PR 1/2?
>>
>> I may have done something wrong? Can you please take a look?
> 
> We tend to pull in similar branches from different submitters together,
> I only got through the defconfig, drivers and arm32 branches yesterday,
> the DT branches should get there in the next few days. It's a bit late
> because of lpc, but unless something shows up it should be there in
> the next two days.
> 
>        Arnd

Sorry to bother you guys again, but I still don't see the commits in 
this PR in any of the soc branches. Please let me know if there's any I 
need to do.

Thanks,
Dinh
