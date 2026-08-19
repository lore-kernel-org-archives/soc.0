Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D365448398
	for <soc@lists.linux.dev>; Wed, 19 Aug 2026 11:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787137920; cv=none; b=MGhv5dipR2ducVIeIU1H9Xoq+H4j5PVfWY42vLpmjm0sPMHBgPFpRko4vNzcW/y7Wu4fAPBXyxXJi8f6iW0un0lGQxwSdpAD4w6mM7J9DvxjkHsdaQDIUF7oFlhwFcBmRQTaw1hWiIsCOm397W4tANXlfC1tXeMapKyhA2BStvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787137920; c=relaxed/simple;
	bh=a/koEVHecgXqrfWJyLLcgKfG7bT42qEiEdFIRdYvslQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XVpKUqDCVZGo7A1XbhnhS0fdvH8oVasrql3t+hYJ4x8d1KzK2JUDWZT/ntP4xQpeMMeRY71h6EQceIqD5eGbaUtZLmw9ZNGHQbvMo9YeilXvC56jOrJYFG8+OiqOodf8fBVCdG+tjkE9Sj+DGv6UP6XRI0W42x94SDAQuxQX8gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=WjPUYvvO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ex5hTAmf; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="WjPUYvvO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ex5hTAmf"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id BE103EC011B;
	Wed, 19 Aug 2026 07:11:57 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 19 Aug 2026 07:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787137917;
	 x=1787224317; bh=zE0F6QVUpFQzojqBG+RGsFmPu0EAPqBeBw4LG2dZtbA=; b=
	WjPUYvvOsmW27NieJM3h+wwyewODomoHK1qF7XRohuZVfJtWhFKcPskqMOLPM1aO
	wJHDCoTRowLjPbu31RetNF35YqK/RhA85jZa/k/ZvfzL1trMVeVYzxPj4mWVMKBm
	OONQ/Gj376rd5JZiyXUkwbFU4ywoTqHHuCcSwVpGwV5f+s7E29sPKyKlgSVEbYun
	HIRAJieoWN1gMd/ENR6aiMIhASl5HzkEoDU5zZNqUddj9tkQeDBVQSGg7QpElXy6
	jBviGLLZi9W20e7IrzK+iyNGjdm95ejRCUwm39uBYUcmWY8KFbA15fddnLA/t+xi
	bVKqcG94/+OYOxALF/RbDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787137917; x=
	1787224317; bh=zE0F6QVUpFQzojqBG+RGsFmPu0EAPqBeBw4LG2dZtbA=; b=e
	x5hTAmfGBi5KIDrg2zrgDEF0IGVjJcG/p5wt0tWi0FVLX+lAU+BlA3BCnQfbSQqR
	/UBoLLRaQjIdYOLF6WhQIe2qAyEhGv0hIlSmaHdIRlOo0Dfd0Kx7PWyJhJ8edi5u
	FKLcxLKtYD7f3rLBepJa19rQdEbjzp4Rp/y4IVUtikKeDlMzVxqRFv3oPxHak4as
	4GvsMdeORQMBh7xM0XPSvaPOc9fmEWGl0P7Zz6nGfigTJhW2UvsgOGgHIanI0+je
	M4M4UWbbmQBx2lHBNoF/upXP/MOMdSsXblVx/9mSnvRhByRgaeB8/sIy6aphnAln
	e8HfFTap+PFy79UnVhxuA==
X-ME-Sender: <xms:eY-Fao5i2XICas08aBz07UU0p1r9F3F67L-MMHgI5TjdIiFDuSV8fw>
    <xme:eY-FaktekQ-qnfthYB5lmC54yvsMyqJugMqmQ8QOQTj99dxUNi49A6gaFbRoi4phM
    Hz3kKeJgsOvR4MeXG_HeOWMu7u7NSefeH0GnaV3aZUm2tYlf7xv6Q>
X-ME-Proxy-Cause: dmFkZTEYQQ1GEHkYJ5HF4XEyYeOee1p6w/0neEEN7YWlPBGZRtNwmP+JbYzCszTvYH8QC9
    wsx0MBs11HLtgdRv120WsnfwBuqHgk/L452mfp7wTtf0m0INc5cllaAORFezTXjlvN8IG5
    Z72vPDZMpqQ6C2csqVueYWK1hDqD4jTGjkMrxoxUrs1a6MWw9iHT3eCFEyWyerg1eGvm01
    XnjeNmV7n0SeTMv4+xG7VpjSKDKVrleIeoxj6KXQBGaO3ljJHOq7muBYWsaFculc+/TQ2j
    aimdH8DXKPXXKfzsECZG786koaPKxTvAiPD9QuDUgZm0jHMc1oWVhPCBMcqUSatS0I9fUK
    g20iGcZ5eMl/XRMHy7kKoAdhDl0UoKG5ca4jIYuvPxuMd0b59sL2qGJ2Kz6MxE4ipFtHIT
    jJIQr1dhX8c7tqLETFsTjtK63lcj2ivzVCp27Mnt4lYRgEVU73ncE/xSHCf/OtRqauBVvR
    S8ZGMrLfQPbq8/RdX/8jzSPfPaKHyb/hnpDTSAxiDPMRgkPRVDAFkkIyj0+AKnUHxaKhLw
    xsKC82QeV0fp7qzDINrAV2cTtQtRbQLUu2dOUorbZxkkOL/duPW7LK0w8TWqXGGwEbn86V
    y0L/ptCD/DEVEHn581WQJ/70DiAVsYMMi0OpNyMS2K7m3UwoqaV2eMxuukNg
X-ME-Proxy: <xmx:eo-Fainc-yNE2iNwHYThItlwi8A0bmv8HcmILl_hdNPrxjYX_cIjlA>
    <xmx:eo-Fagt6AjlUbSNZcmz9Y1VwdCgMqSiT9jPBL_3qxXsoklyt4G-5Ow>
    <xmx:eo-Fao9r6i7yZ97bGxLHgZtH79s4Q4K2by0wHMumbF5ZOOEuPs3hsg>
    <xmx:eo-FaiNw50VgUEBUZwyI7_g2K-BPZChp57KV2-OmF_4eW4qOI-lNhQ>
    <xmx:fY-Fav-PZ_-s62bEfTI1bhyTnjicg5YNI0Mmk83tiYC88xNntWrNFvk2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 317D632A0071; Wed, 19 Aug 2026 07:11:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AhjJ9KJfpBQc
Date: Wed, 19 Aug 2026 13:11:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <e7d5b920-80d9-4d76-b92f-03494081eb9d@app.fastmail.com>
In-Reply-To: 
 <CAHk-=wh8khg-Odf9cg2jWe1jvSviTwGgKG9vUDzYNdMzgmxDhQ@mail.gmail.com>
References: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
 <CAHk-=wh8khg-Odf9cg2jWe1jvSviTwGgKG9vUDzYNdMzgmxDhQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] soc: drivers for 7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 19, 2026, at 04:46, Linus Torvalds wrote:
> On Tue, 18 Aug 2026 at 14:17, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>>  .mailmap                                           |    6 +-
>>  Documentation/ABI/testing/debugfs-vfio             |   26 +
>>  .../ABI/testing/sysfs-bus-pci-drivers-xhci_hcd     |    2 +-
> [...]
>>  tools/virtio/linux/mod_devicetable.h               |   14 +
>>  tools/virtio/linux/virtio_features.h               |   79 ++
>>  2565 files changed, 15693 insertions(+), 8154 deletions(-)
>
> Well, that diffstat was just garbage.  The real one looks something like this:
>
>    121 files changed, 4566 insertions(+), 1492 deletions(-)
>
...
>
> I don't actually require that kind of better pull request, but it
> would make your PRs look nicer.

Thanks for letting me know, I really should have caught this
while sending the pull request. I was fairly sure that I had
not introduced any backmerges or octopus merges myself, so
I didn't pay enough attention when preparing the pull requests.

What what I can tell, the thing that tripped me up was commit
980a8bfe7bae ("Merge branches 'for-next/scmi/fixes' and
'for-next/ffa/fixes'"), which I pulled in as part of a normal
downstream branch.

      Arnd 
