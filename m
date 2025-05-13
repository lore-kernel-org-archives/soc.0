Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D141C7F
	for <soc@lists.linux.dev>; Tue, 13 May 2025 02:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747103291; cv=none; b=sgvwPklEy5qfMN1L5ReLlGrtaessA7ZyvjjTOnuhcI+5g8NqhH7htE0fsXO6+oc8JmgGHWUptw5keGgQzZOy1EasZq8o3/lu9XjErYtE9cewYT68qy1Vra8F8bFzpbaGniX0/rOm++MScKsKUEsxvbC2EeACfnErNjv/MtuzWls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747103291; c=relaxed/simple;
	bh=D7xptc1R3SsJFK6sKlRnaBVgiDudW1HvUViVifIPIks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rg8SPIcUnHk8mE8ztQYW0vzkPW7t2P31OVv3jyoT+1yqP7UEqg7PyyLEtakDOLTTJ/E18tGCMJS5tPNtO6kTVTnpq1OTBYwQxiOG4sgQMxQMDMyIayht4WULCwpyzB4wc+hcPotNnoywvFGjJYjelzDwvkPC9ojqKRT4ur9m4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ga6m+Zwo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ga6m+Zwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66D7C4CEE7;
	Tue, 13 May 2025 02:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747103291;
	bh=D7xptc1R3SsJFK6sKlRnaBVgiDudW1HvUViVifIPIks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ga6m+ZwoTs3IXx7Rbp379330O8kywtaWWr7XQtHupSk0ClLfjsmm1EDcnslV2oqd3
	 ssR+K6zUXnpDrt80wlJqjj6yBjqdMVrbhTxe0uZ2Llt4rw6e8mPRFFxYtzDsVg4Iy4
	 3ftzfOhxQKkHePhc2+4v9t6/Qs6HVIP9CxMVTjxeFZluDmT8ynbslbYxCNqCHqxh01
	 +7xuV9vOt1oaSP5SbA97RPKLGLN4IkRPyDPrCri55SQainbK8/PQHR5jbXYKyo9KlL
	 O/tCZ8xG2W7uBgX2eHc7uLaNRhlmtdQjv3D3PRhrQqD9qUE9PCz8MvhpDk227c71QH
	 MOnEJlARoIbwg==
Message-ID: <d3615e4f-4107-4f76-9e8d-c19fcf43c816@kernel.org>
Date: Mon, 12 May 2025 21:28:11 -0500
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ARM: socfpga: updates for v6.16
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc@kernel.org
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250506004825.134929-1-dinguyen@kernel.org>
 <b8257b35-04b7-400b-bc58-948dd5fdf799@app.fastmail.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <b8257b35-04b7-400b-bc58-948dd5fdf799@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/25 15:18, Arnd Bergmann wrote:
> On Tue, May 6, 2025, at 02:48, Dinh Nguyen wrote:
>> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
>>
>>    Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
>> tags/socfpga_dts_updates_for_v6.16
>>
>> for you to fetch changes up to 8dbffe5f5dd531a3c3f9d603462e499085449277:
>>
>>    dt-bindings: clock: socfpga: convert to yaml (2025-05-03 13:33:23 -0500)
>>
>> ----------------------------------------------------------------
>> SoCFPGA DTS updates for v6.16
>> - Updates to dt-bindings
>> 	- Document Agilex5 NAND daughter board
>> 	- Convert Stratix10 FPGA Manager to json-schema
>> 	- Convert Stratix10 Service Layer to json-schema
>> 	- Add document for Terasic's DE10-nano board
>> - Add support for Agilex5 NAND daughter board
>> - Add basic support for Terasic's DE10-nano board
> 
> Hi Dinh,
> 
> I'm not sure exactly what happened, but I see that this is
> almost the same as the previous pull request that you had sent
> for 6.15 in late march.
> 
> I had already pulled in the previous version, and if I pull
> this one now it would result in duplicate commits. Would
> it work for you if I just cherry-pick the "dt-bindings:
> clock: socfpga: convert to yaml" patch on top, to avoid
> rebasing everything else?

I apologize, I just assumed that since I missed the 6.15 window, that it 
would gone and I'd rebase for v6.16. They are the same patches. I'll 
remember that next time. Yes, just the "dt-bindings: clock: socfpga: 
convert to yaml" patch would be fine.

> 
> Note: the list address has changed again, so please send
> future pull requests to soc@lists.linux.dev, cc:linux-arm-kernel.
> The arm@kernel.org and soc@kernel.org aliases still work
> for the moment, but the real address is the @lists.linux.dev
> one.
> 

Noted.

Thanks,
Dinh


