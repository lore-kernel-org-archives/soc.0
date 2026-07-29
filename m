Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB53AAF7F
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340185; cv=pass; b=kaJtB44r5fqswGmMdPKhcTllb14qRLFcahUQwiw2pzicijDzo94L3GGeMDV+qUB5ISpXFB6j7DCkjqDX0U+XQ2FrUDeIwetsKA+Z9i3W7ZvEHvTPQhr0tWiOHDyKJcq/YywYueh62yWB9wROoHcewkY7OsxhfGvUTUNr+DGdxqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340185; c=relaxed/simple;
	bh=JQ00ONkW6MGWnHjnMydG67jPOTGSvZ3NRRKwLu5pYsU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gIfI4SRT5tuQgymBaZfO5MK6R0OcWlVDzD//GkkFvBF/48NRkKHf4JMimy2THKXrOE5sOkRllZyzB+pGHr1/a48F05yn/PAigN8tJ5BKpd2bB9XJYiNhIDrTya4FtisCv/qBA1Zud/GEnB6DmRPguZUeGCsGYgZUFYmJI3J/pyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=b26o47eW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PfyeBWqT; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="b26o47eW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PfyeBWqT"
Received: by smtp.kernel.org (Postfix)
	id 2E0D31F00A3A; Wed, 29 Jul 2026 15:49:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785340184;
	b=QEPzb8hWY/duICrK6aMeUMxDTttCoSEBCShBF3izEiXsebVby/QNeuZbivlk5CqiAqZd
	 qqpLzm2r1W/ZoTYNF6lZ01lnD9tsdLHnotZYu7rKrK5BplI4mJ0uXQbVG3hHhalRFxbkY
	 3aCEZZRKwVTDzq31DxBPhdjfRmbjYRa2UyxGXbUnvOyq35dIVABjqFfJupsGhcIr/ou3B
	 CpVJk2Ljav6xjxM2IFiTZRG3LVo0wOQr3nH9sDVsoZnCgJaJ4R4X9DVIEJ1gvMvvrLd8+
	 51h/tvh515f/V9ux2lzh/cEeAii/Y289WZNDGkztA6Ldo1Ykm+ZpZ6DFGTvBce0V0Ag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785340184;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=oQd+PKYg2SrS9YmpMTZzmi1rzZRa5OmKfOaIKvd4BaU=;
	b=qEL0yqtJ5WgWI0o5uMOwgTHayCKIGo/AFxMKZAQ+Nbjw/m8yVZLz3BmZJHt5lTSZBMOC
	 vqeGSE57zDDHvouozUb48vyJDAoZhmdKqNOf7yHlvB7S5C1mnngVw7V9AAsgYHv5syyPP
	 r8691piV+HLHtwhxEdbndYJTFo8N6+iGEU4Fg95NDTvZNfAOR15PLsNdL8XHS4G92Kch0
	 mZT2oKwg8Z1AisXEmIp2NeVDRagSdbTKR91rKumLyGDpbpr1oBYcNcrrX9/QA3zM5Q8nc
	 +1/dXw/21OqGAD2CkH7EdUbcUk16sUf/Dm/HFZw1JshyV+Gel9MPtGdujIWolQoX3wQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=b26o47eW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PfyeBWqT;
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F4181F000E9;
	Wed, 29 Jul 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=b26o47eW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PfyeBWqT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7F4181F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id BD8101D0011A;
	Wed, 29 Jul 2026 11:49:42 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 29 Jul 2026 11:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785340182;
	 x=1785426582; bh=oQd+PKYg2SrS9YmpMTZzmi1rzZRa5OmKfOaIKvd4BaU=; b=
	b26o47eWvoAOFjeXEWyfIbfcvKzOlhtWtolL6zXsin632c5Lhm1Ot9VuvuFRNJS3
	t/Evg05k8gZa3d/R+VF3J0o0k0HQ7/cVzcP05P7vUl695Ie3Tvng2ZpsmbO68idY
	knVPl+7iv1WkVLOW6Mw3krCpnTMxBbrxnWyTVFi0U5UvF5IHpYGQMPCSZ+kjIZiN
	ECjqj/dqUv7DFlKGSTbCWUArYxoBJZWeoxr2nUgLvSdeJ6R2CYiK/EjTrj/Ca9Wp
	gqoWIkjDIB62GYqlsUuWjIpw+GiPPA3ZgD5mWl9OkGISlVK9gGffA/Cc+wXY3Ln5
	60rvIsCj4bG6E2yVgvkfSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785340182; x=
	1785426582; bh=oQd+PKYg2SrS9YmpMTZzmi1rzZRa5OmKfOaIKvd4BaU=; b=P
	fyeBWqT6jRFBZMuJL13w0llBqGuTGHZG5WMzeCHtd0o9GuccC3DHQTeSLpas+EyM
	w3MMdL7MmLe3tEDHhQHHWv7ilEexzFtpx43yjO0yzMIH+mQxTUm5PbFBXjMhrKOy
	zPBHLg7c1q1BbWeZ7Dk0+UK7Bo7lvIU42Jnstz/npSD1EX2gGWd6zBUOKvouDZ8u
	hEL3AUHh/X9bbiNQLUyvXb88zGUnERo0fbwh/UURW/8j4Uxqz8QudfFp+vXPcs7e
	C/Q6axR/T9G6o+MKgvK9u49IKJVAgQ6x4ZQlmmDBWU9T9p2uqyvO6yQtEKpTY73I
	owTlOFHORlIX6diNOvImw==
X-ME-Sender: <xms:FiFqakPzmS8KQYVzSq8Q3GmJjEzmvDJsuGiW85jwG3Rjo1c-1jY0XQ>
    <xme:FiFqalyZbcxnYvefB1Ye22dtA7ppYCk4LSIDT-t9T6kwSf4G-liseGCZY4WjSiWMq
    J3sNeQZnco24jGc2nZLOmfjMKx64JYsmkLQPvI8Ou94SxMLsVEQQWUJ>
X-ME-Proxy-Cause: dmFkZTEAyhqDvJeN6sC00nrS4GH93muUtp1FPUrKchOpg0VdjiYsXIoAe2zJ3VMf/DUodn
    RrZLFl0kfeT1+zgD3tRPqzt3Vw/YaAnP+0uH3CC1FCrlrWz7J5y4eCAY6s6XqmrYCxvrsM
    ZTx4y4ul/tMPWDH+Pj9Xyi3i5qV0rmzz7IAiZ3DPZ+dB45MLXp3JtrVyHLfeo7likE+yTe
    XTC+zjjvnGa0TNiLVFYXZN0clt8U5TbLmm+IMpoIKbj7vWk/GkIzD3ejs+NmhrUPXamvrO
    iOAmTwZan0rjGdm3PsfemjCjQmAo2F4qP3JYvLDxNs/cB9xPEiqOL9zbvciDKG9+AazeeY
    067KfJvU8iPJdV54yLFuArogXd+Ye1GQAXl/I5+N+zpUeXR8Ii3jB3kHsDDciEhseBYzlI
    ETrdKAM50hJQFjt/SgbV88U3w3g9YG99aBzn03PMyAqByZ7THsYGtrViCWXCn41tpE7umy
    bQV2+BS0hF1po+OGZDjXKEbERzNfysLaIAR7Xit8XT1ScmdMqCWw2nkYt8VQF8WYSwDpf9
    Goh4vZxUvx9roqGpAuXqWtpsD3z3lVRmCMIO43TnIsc8PuiKPs0AUIMvwPOOWnFi12MRvG
    J1PbeM2vhQdALy2wwtJzNxCLO2SLxfLyfAHzaUdTcQckVPVSdWEPbtd2CAgg
X-ME-Proxy: <xmx:FiFqat6qCSrETiPUP21GnTsG9VleAgPpOyESj7AFZh_eJCN0BP-TBg>
    <xmx:FiFqakOkNoKrJdElhxxu59-KFQyooXLxZJtX3C7NYg2GIgCvCJVaTQ>
    <xmx:FiFqarvxEXeDmeIk-RbMlo8eBcvW2dHEKGlAn2iCpTcvTB-Q_gY_bA>
    <xmx:FiFqanYNZmP2lwW5atuYwYx7gM2sTMuBiEygmJpe_Bs5iL0O-5zJEA>
    <xmx:FiFqahYG4HTsmIPxJTcTY_vDuqCDGs9RVhIKkYsT5crc4QIh8IT6j4NV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6797E182007E; Wed, 29 Jul 2026 11:49:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AlS3N7dQjmI-
Date: Wed, 29 Jul 2026 17:49:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Florian Fainelli" <florian.fainelli@broadcom.com>, soc@kernel.org
Cc: "Rosen Penev" <rosenp@gmail.com>, linux-arm-kernel@lists.infradead.org,
 "Kevin Hilman" <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
Message-Id: <5ed3a50d-b87d-4df6-b81a-ffc5264a553f@app.fastmail.com>
In-Reply-To: <20260727201200.2441827-1-florian.fainelli@broadcom.com>
References: <20260727201200.2441827-1-florian.fainelli@broadcom.com>
Subject: Re: [GIT PULL] Broadcom devicetree fixes for 7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jul 27, 2026, at 22:12, Florian Fainelli wrote:
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
> 7.2, please pull the following:
>
> - Rosen fixes the Linksys EA9200 NVRAM DT size, the 2nd PCIe controller
>   interrupt that was duplicated, and finally removes incorrect PCIe DT
>   nodes 'ranges' properties breaking PCIe

Hi Florian,

The third patch dropping the AXI bus ranges looks wrong to me,
I've commented on the original patch submission and dropped
this pull request from my queue.

I only have one other fix (arm64: dts: broadcom: bcm2712:
Remove non-functional EL2 virtual timer) pending in the fixes
branch, so we should have a few days to resolve this, but feel
free to resend the other two fixes separately.

     Arnd
