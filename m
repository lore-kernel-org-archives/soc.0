Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614817;
	b=YmnB4ZrQtv/ssF+Ac8o/QlsSvgnI9tlLoVf9XJmFClYk+8VJpgfjWZCO7Ks836IeSEIq
	 z+B0pM4rXf+eBdkCuB87SegY0oQfmZDGQFIfoGJ321woTUrbuaS4D9VYYNr4NsjWqRiia
	 gZbQS4ZzcEiV4Uq+x/fXxoJp7aMFQkHcL5CishSnMxfhg7nBhY4I3PHuqf2M82NWIhFCx
	 b0G1wUhoZiJzxmRZcS2416/4h0P31aiv69pIHKHsvJLUVYr/k9PqqrCKY5zC3qG3gxNss
	 nMQhLBNbCtbk+6IxP6M0dpqkOZYuGdfzdyeY6TmNpUw2vPdco0KerNfIPl7USWRGPyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614817;
	h=Received:Delivered-To:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lPaSUru2B5F5z2f2ZpGFFsohfOzlS7mkdj/jFnK7WjM=;
	b=nUh4xW3uS/SXtf07hd//7bE+U7ZmJDBTMYa57HbB6xR3zOMeTPE7Pjlh5uKTwn8jgalw
	 9yXIT9to6iFX2MATUtfoFcbo9FW5EqAE+Or8whxwIrMfA9QPT+rV+1OqjSh8zpZRUuw1E
	 T4zJ/gvAhG2wUnQiStGVES7HSu/YfH9FNn9v2PWryojCEV6f0T6VOnvfGVgaxiuHCaQyM
	 PPaqKyxhA33XKCb4XptlRw4flMWb67DXnLSOy2li3XvJBS9Hm3Cw836NZDR+8pLITLhJb
	 hP8ZfGPLooov1toiFrD83GkglYMMyGnduZCPsg1kxoMJzQrRMMbtbONpkNNzsSc6FcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFUSWq1a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648CA606A31A
	for <soc@lists.linux.dev>; Wed, 21 Oct 2026 20:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFUSWq1a
Received: by smtp.kernel.org (Postfix)
	id 573E81F000C2; Wed, 21 Oct 2026 20:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03BC1F000C1;
	Wed, 21 Oct 2026 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792614817;
	bh=lPaSUru2B5F5z2f2ZpGFFsohfOzlS7mkdj/jFnK7WjM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gFUSWq1a3s7JnLJx7aIUGtk6tguR19VtKy89KNGdiSZQKdFhU8MMRtzKWuq2850yz
	 v/Ldj9OQDaH1SjVT1SnaK2AyiX+99YFgJyilUMzA6k3L/tKzuxyQM/fqLVR+7vqbwa
	 q7bh52D3mMU978mRDphiEED7fuaF/ez+C2eZCasfl2HZILwzfBsRXeQAlbQDdORBdl
	 HlHmAs6eMVD+KiT2AqtqRo7ehO/F1yzVFV1q6KuzLewHYrmc5WDl5P9EVCMDs9QLc4
	 II5cX0qZRzon4EsQN3AU4j+xJihI8b3XL4V4pqriaOWhkmNMTln47OGeA0HFP3T7il
	 smVGiFy+mGKdQ==
Message-ID: <c4f40f7a-f2ef-408f-9aa4-57dcb7a5d9e2@kernel.org>
Date: Wed, 21 Oct 2026 15:33:35 -0500
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org
References: <20261008164735.566333-1-dinguyen@kernel.org>
 <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
 <e47367d1-9c46-43fe-b657-28358def2804@kernel.org>
 <93418744-ba09-4031-b96b-24fea70d4cb8@app.fastmail.com>
 <2a568553-b3b5-4072-9313-a8f63d3541a5@kernel.org>
 <f6262d7d-d5da-4be3-b37a-81ba3e35bba5@app.fastmail.com>
 <202610211826058f634946@mail.local>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <202610211826058f634946@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/21/26 13:26, Alexandre Belloni wrote:
> On 21/10/2026 18:46:39+0200, Arnd Bergmann wrote:
>> On Mon, Oct 19, 2026, at 15:21, Dinh Nguyen wrote:
>>> On 10/14/26 02:06, Arnd Bergmann wrote:
>>>> On Wed, Oct 14, 2026, at 01:33, Dinh Nguyen wrote:
>>>>>
>>>>> I see that the bot has pull in the 2/2 of PR, but something may have
>>>>> gone wrong with the PR 1/2?
>>>>>
>>>>> I may have done something wrong? Can you please take a look?
>>>>
>>>> We tend to pull in similar branches from different submitters together,
>>>> I only got through the defconfig, drivers and arm32 branches yesterday,
>>>> the DT branches should get there in the next few days. It's a bit late
>>>> because of lpc, but unless something shows up it should be there in
>>>> the next two days.
>>>
>>> Sorry to bother you guys again, but I still don't see the commits in
>>> this PR in any of the soc branches. Please let me know if there's any I
>>> need to do.
>>
>> Hi Dinh,
>>
>> Sorry for missing this: Alexandre pointed out that when he looked
>> at the branch it was not part of linux-next and did not pull it,
>> and I assumed that he had notified you about it when I did the
>> final merges for 7.4.
>>
>> I see that you have a for-next branch with a different set of commit
>> IDs but overlapping contents. Can you explain what is going on?
>> I normall expect that whatever you send for inclusion in the soc
>> tree has seen some time in linux-next using the exact git commits.

Yes, I was aware of the linux-next requirement and have been placing the 
commits into the for-next branch. I was cherry-picking the commits into 
my for-next branch. I didn't realized you needed to preserve the same 
commit IDs as well. I will change my process to keep the same commit IDs 
going forward.

>>
>> I fear that at this point it is a little late to take either
>> version of the branch, but it would be nice if you could see
>> if there are important changes (not new features) that you can rebase
>> and send for the first set of fixes that can still make it into -rc1.
>>

Ok, will do.
> 
> My mistake, I forgot to notify, I wanted to sort out whether the new
> dtbs_check warnings I had where due to the renaming or had another
> reason.
> 
> After removing some false positives, the issues were:
> 
> cbce4a0dacb6: arm64: dts: intel: agilex5: add USB3.1 controller node
>        + /soc@0/bus@11000000/usb@0: failed to match any schema with compatible: ['altr,agilex5-dwc3']
>          from arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi:534 (dtsi)
> 
> The issue here is that GKH never took the related dt-bindings, I
> believe because Krzysztof had comments on it.

I saw that the bindings got the Reviewed-by:[1] Krzysztof so I went 
ahead and applied the DTS.
> 
> 29f11fb83ad5: arm64: dts: agilex5: add support for debug daughter card
>        + /soc@0/spi@10da4000/eeprom@0: failed to match any schema with compatible: ['microchip,25aa128', 'atmel,at25']
>          from arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_debug.dts:101 (dts)
> 
> 
> It seems that there is a different version of the branch in linux-next.
> 

I will address this in the next release.

Thanks,
Dinh


[1] 
https://lore.kernel.org/all/20260911-nondescript-toucan-of-perspective-6bd8bd@quoll/
