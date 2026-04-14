Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20A2E5B1B
	for <soc@lists.linux.dev>; Tue, 14 Apr 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178949; cv=none; b=AhnTGD1oZgtwrI/T1YcC9NZZzf6n7CP5IfYxwHWBOWqrdVr6NDjzbOenDVWwGbdxFX3Fy/MblzoZVrpK4UYK3ttDrB7vV9RAboruZoNEo9WRHCznvo+vLU1ApcFRGjYyfJdJe/YY4jFUh9CMwTYhyjUDsRkphrH4MCv2K6oYdv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178949; c=relaxed/simple;
	bh=vW05K9AslGp6w7U3MIWn+OuTXBMpNiQZO0IXyd9u+HA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHpTmuGatG/32jg+gjT2GVmWaQER2/zWl0CUYYqA4AbbhysUw7jHrdupvclxg3mXBoFmkGQfN/3JkXriCuejIpGMydoPP6wLpofANPfe+VHtX26hOYgpl5m0vumi+nL0LizKcfHhnIIkaAjCyslJ/eEsDhzwn+daPiY3dKbh8ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3JH506m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3JH506m"
Received: by smtp.kernel.org (Postfix)
	id 6E3F3C2BCB5; Tue, 14 Apr 2026 15:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21283C19425;
	Tue, 14 Apr 2026 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776178949;
	bh=vW05K9AslGp6w7U3MIWn+OuTXBMpNiQZO0IXyd9u+HA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X3JH506mv0cWXcsjgVzgnDdyj1Sd5iMVhdr3HVdUqNe33JWVA3QmsIDg/Z5Z5C/JE
	 1aFyZ1SP6ezXyt4yTOBszqbaFFiW8An1bHd6nMqdYNL7+wjPK7E9Hos0t3wB4KE9o7
	 G1w3Vd2s4waKZXtzGfrm5j/fg2nuSW0ZcXZg/cODVDPFVDioMNBUHfnGNk1FNBETZa
	 NhUXYOsaeSloA7ymKDtgeF4RWbbBb4DAmhWvlmX2fG+TJxbfWYeJ1/Jm+q02H+sHFq
	 hN++0ee66fJUgebYi5XtlHWGHPNzFrjrwXeOyOiEeljw2XYa7HR8LL9CrqfaKHn2PA
	 qBTA0COD6fdgg==
Message-ID: <a7d13f9e-7a95-4464-abe8-c095354f9908@kernel.org>
Date: Tue, 14 Apr 2026 17:02:25 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] SOC FSL for 6.20
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
References: <69cdadd6-523c-4a79-8cb3-1deff5910699@kernel.org>
 <f48af0d1-0980-46dd-b2e9-081b019381e2@app.fastmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <f48af0d1-0980-46dd-b2e9-081b019381e2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 14/04/2026 à 16:55, Arnd Bergmann a écrit :
> On Tue, Apr 14, 2026, at 16:08, Christophe Leroy (CS GROUP) wrote:
>> Hi Arnd,
>>
>> Please pull the following Freescale Soc Drivers changes for 7.1
>>
>> Changes to fsl-mc bus are reviewed or acked by Ioana Ciornei.
> 
> Hi Christophe,
> 
> This is really too late for 7.1: the merge window is
> already open, and I see that all the commits have a committer
> date of today, though some appear to be freshly rebased
> and had an earlier version in linux-next.
> 
> I don't think any of these are urgent bugfixes, so I'd
> suggest you rebase onto 7.1-rc1 and send these again for
> 7.2.

Uhm .... Maybe I made it wrong. All those changes have spent quite some 
time in linux-next but the branch was based on the tag soc_fsl-7.0-2 
that you merged into 7.0-rc5.
This morning I fetched soc tree and saw that the soc/driver branch was 
based on rc1, so to avoid pulling 7.0-rc5 I rebased the changes on 7.0-rc1.

Should I restore the original branch as it was in Linux-next until this 
morning and send a new pull request ?

Christophe
