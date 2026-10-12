Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089F92BD09
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796661; cv=pass; b=tr6t0aOCeIZOxuJbMC7BHNRJBEGNP05L86XJIUSbLxoztfY0yl9RWEq7CSYQIWRu8RbcKaLKvYkbizIvcPBYUl7SIfblxT/DphEFDiI1EA4I/efzkoCDphBxIkPIcz9qAgNDgsSaDN0M2QdEMee/myfmUha7aP4htBn2FTDXwqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796661; c=relaxed/simple;
	bh=vvu0r8CNgLquCqjXc2EUudX85AHvSHWoKB7SQGnc4io=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Sld8P5lAo0f4ghbc/FFvJz8xzuqAagDLSTPoz5wpKTZhJBoYd0BB7G5c4swKrhsdFKILDYo7d1dZlbo6HGS1lOfKNy1InxZr6Ej5UvuA6fK34bXp3KwkzSkYkTxmAE/tkPcsX/xR6q0012kZXQRZt7c1W5mQYvnmzMg8oSpxmBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iDT5rFMt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W35bFjKf; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iDT5rFMt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W35bFjKf"
Received: by smtp.kernel.org (Postfix)
	id D26221F0089B; Mon, 12 Oct 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791796659;
	b=AXVl1eyxPiZ+xFkJOF1Cd77jnElUVA9wqup5OamU34wWByQAcI7oIf6acmw+6o3BllzJ
	 kQalGQNkmW6t8gsuv+TTgHM5gebjzBJDxaF+3pb8kMol+O/gUAyYQjeM+Ham6RfGQqPyV
	 lRr5fAt7brnQdxsQqR7Iwi8UTQBkuEoJkzFThoJvefaBRIwfT99k7s5DkFX8nBX86DXXd
	 IRFk9+YbhgoPj6UR8ZjbPG34vC42OvrG5Ar2LpSCOVzVdK+9dxZ5g8918JoKkPsDEngJX
	 Il4rjvDmNW6AEdlqlweCxmDgGw1+JrLxNMGvdtIJFqvBjDkDfYUNr7BcuGnarOyWXpg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791796659;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=GJY0qHfhdj9lHENat8tBveKPiLmpddTE5X7F/5JKHlw=;
	b=3GYO8Lu6QVeOW9Ioz+0bWZAqDNuKWvNrtKcAcwVTDHlIApvVGmUEXS4ObRR1nFOIwC6p
	 BI/XOp3dGcYdCfRZouzM8jaeWJYtCB4B+Buurp+YTLRMf5RVUlDJ8AUmCOcngSIHZRr3Q
	 s10XjrmL7UY3V05UBnW+JiakxPAjMFYXMmB29DUvhefMSxh0Iuc+ek10q+nIP1QhklRUj
	 AOiuQ/9FoqxhSHodYLAyKzw5gF1jBRisAW9lZRN7F2QaS6bOtfeufvbVM5aG+HUgwQjHe
	 iZw5lv+Bs9C1jYJ9qcm+xQPFOqnzk0iQR5iNtrZ7idc/Jygy9qLfnNHFf3tr7B8L5hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=iDT5rFMt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=W35bFjKf;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 664231F0089C
	for <soc@kernel.org>; Mon, 12 Oct 2026 09:17:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=iDT5rFMt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=W35bFjKf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 664231F0089C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 83ED7EC040F
	for <soc@kernel.org>; Mon, 12 Oct 2026 05:17:37 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 12 Oct 2026 05:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791796656;
	 x=1791883056; bh=GJY0qHfhdj9lHENat8tBveKPiLmpddTE5X7F/5JKHlw=; b=
	iDT5rFMtIABrxoUiQ7QdTflV2Ff5aTe9/kl0gz8FxvlMRXhSCtvg0XODUpvSSQBY
	bIxXhN+ESwc1ha5UTyuTbvgHnNpQk9GxGfrZAQm/Q9FziZ1/uEjnB82aPeAAo0kN
	Jbp6fTeO4BiVPAOmALuYg+IZffqUU53zZdwnQ5tiB4kBE4sSUjp6Dt6//Mdmc2qz
	xbOyBN92z6QWX/hasYtUhmUa0E6a55Zf8aK3lTcmX8+DZPXNXQEdtYDAJDql8ygX
	ULPfzQos4UQv+ixKuKw4mhKstyiKuvrjfaa8IBUCXStS5/z+ZnDE2qE/69TC37Bg
	3K6z4bzb3Gls6LRebiYs3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791796656; x=
	1791883056; bh=GJY0qHfhdj9lHENat8tBveKPiLmpddTE5X7F/5JKHlw=; b=W
	35bFjKfIiqWzVZrMg8n+HWt9LIaMj5y3vow0bSbYfcc0N8X/uK4OSnZw/zyzjY85
	CVdhx2VyTwzpLEpepAXnw9k2UY7VFVsV3VLpwjcB/9O2FAG6sJpFMfzN9a++upPP
	Q4fIWds2d+2cRctOcVEY2OCgHudxzQclvl+w/Mt81/jGI4Vrgu1huNqS2I8zpNSZ
	ltPt+7MyTMauMJIfxLdDMdB5bBmGEcpcQXr0U2JjCb0cs/YfEJN8ycGtfYbrLzPE
	26WA3ShAn3OG9VJV2QOlNZGqAKtsy0hAoA+P1XlkdfVWukDvILuLHtTIA9nQAUxX
	MND6piYESn/pctuaHBmkQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791796656; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BrZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:UxmDl1pMkXVjflXemjS62qg7xnGQWz6Y8SJhXkKF0YmfjqE
	hrPNPtrv97QnZt9naj6kGFf3Xg/fkYGvMXvp3DmiHrI/fTBh8bM2/9yNswtmsciS
	GN8vv8M+JjL+3DogJbjghoh7L4hmeVSUw19ILNw1OXQvOP6rhEPGORM0qxup3oLC
	55bx0SX0BE7JsOGtb0ES/wj2mXtwzMCeAV9PFxOSEb9ok5XENc+gZ+nOV2+to3w+
	N0BsHsVePfaSX0Yu6ILqlAwEThYqqT1eBu7X1A3C4AB4BZhzxdw+sLbIOvCrOoyY
	9W4gUJe/fOc8ScwMevqA0+2lDe8DgUSCTlRdb/g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bVtpMSKtpLhAe+mMBBoQbWPIbks4fgup1XAJvD3vbco=:vvu0r8CNgLquCqjXc2EUudX85AHvSHWoKB7SQGnc4io=;
X-ME-Sender: <xms:raXMaozfnJWk_rRv2n0uzJiOVbUB5WZq7bgXZRTChT4xLQ3R1N6AnA>
    <xme:raXManHKQf0exSld_99MEYoRwfOzXPUu4ZzDIZ26bKWLUWrbVPj2DV3a7vdGkDcKk
    TBY7CN933x-CLFE0SDRvEMpxhIzA9jvAPPXmAjj0Ayt5p7A-vxrUwB_>
X-ME-Proxy-Cause: dmFkZTFrHEGwKBdVR8IwyDUhNgBLm/x6Ectrg5hjHEv4JpB9TqYBiUC4MIz/WeB/VY+cav
    bPTsUM3S7qwhTFTfV8wWYPu7WnJ/9SVdOg/ka9qBCp9p8r+/Ps3fHFlTE1M7H80I11Mi2K
    hFYAqlQep0Z2JoB0Q6mut7vLvApSpCXTxDx6Ld/9VH/ErXV2gMCrz4TNnfXy5k9qJfw34e
    nY5VTAt8Cf7w+d7m/8+HQM4omRGrcopizMeaD5fTkJjEH+Pid/kvF9V9R87faGzSpFU4Ey
    mPnF9KagJocqP6aLsbL1Rb087DI7j6rbs+k8YEK4gkIpo3+d+zQD1/PNZc6flKvtoLERtm
    IpDxb290wPo7UZ/ZnQPV8EQIstcOYP76q6FDIoSWNQdUBXWfWokrwWSd5Rqd7JdN7NAwNd
    0dyX/gisWLWv7ye2UhF696VRVx+R2fxqARHS5Isvj+I78Jt3XQlwApw0Wyd9oHmz/W5J5V
    tDQaoft1Ky6Y/DGu628KNGev9NdHVksY7rH+6Sdh/XVJHKl8+sAG5mACwBXsLt9aLsQxrf
    nH4Dy33QhCcoOH3ekNTYcELNc3uhBpGcbwweOfsTVKb4F4S66Cd0l5hxGkbYnZDvD/I7+G
    ryBljAMjn+lfH985e81O9hCBLjHH0jhj2mFHoG3ti0+dPi5iz3WdrnQlxr0w
X-ME-Proxy: <xmx:r6XMakkke45n4IRYvHAofzWv47KztiwMtx0P6hkjYCCbHL9Ki8TbZw>
    <xmx:r6XManhKxQU7R-Usv3JT8lK-DnsRMBiRB9cj4mGYz_TKWgKlKPGzLw>
    <xmx:r6XMasffS7WYDmJbsRdsoVjcnkj3OucT7u3v38Nz7NCwV_UbqDd6Bw>
    <xmx:r6XManiBvB0j6rqLAOagmsSbGvkFMPKm4mDKqaj8C1Mve6uiPqMAkA>
    <xmx:sKXMag1JNXA3QvxkXkraEhiRwg_RGFjjf4R7G8pRfkoDDk9M9PAVatDC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C253632A0093; Mon, 12 Oct 2026 05:17:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Anz6JKCoHeJg
Date: Mon, 12 Oct 2026 11:17:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jens Wiklander" <jens.wiklander@oss.qualcomm.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 op-tee@lists.trustedfirmware.org
Message-Id: <8f4ca3ff-8a71-4ab7-a442-9ba38ec74c63@app.fastmail.com>
In-Reply-To: <20261003144629.GA929824@rayden>
References: <20261003144629.GA929824@rayden>
Subject: Re: [GIT PULL] TEE fix for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 3, 2026, at 16:46, Jens Wiklander wrote:
> Hello soc maintainers,
>
> Please pull this small fix for the TEE subsystem. I've only had the patch
> in linux-next for a day, but it has passed my local smoke tests.
>

Hi Jens,

It looks like the patchwork bot missed that I merged this one, I have
now marked it as mainlined in patchwork as it was part of last week's
pull request already.

     Arnd
