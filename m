Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ECC29C327
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011519; cv=none; b=MSYjTA09dZmgoBoXWi4ovNbT/8ej9ocSIzz7Oov1dTJ3VWzqoWzjPdPhneOlk3vGYYnGKgYs69vXA8/0tpudimS4AKjZ5SAPJEnWLfeZlg8sdKvJKzQyVU4tPUjctUgZHO9FCezovC35crS97yKaNPCCd7F3zyNh3a6JxnkthNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011519; c=relaxed/simple;
	bh=g9gTfVfRyn4qnAYOCossZ811oqGpq25xyht6sEd3tgw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QgJSa8m+3felfrRTjyjVqC4QYIuvCgxUiiIarJlDA38rKlNpcizOVXdpHJ1TQkyT4VA4u9x4MTJ9zqBw7Fab1VyM8hA7Jii/KyXTTwcufOQfUP2/H5FTuCem6Xy8KFn2KIanykFGKY/cvKLaiy0LYVAP1aVhjc5S4sOitfDkPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=bai9tG1z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JrGtkjA0; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="bai9tG1z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JrGtkjA0"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 6136E1D0005B;
	Tue,  9 Jun 2026 09:25:17 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 09:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781011517;
	 x=1781097917; bh=JGqLSUHMGrATPT+jYKhYD8UW7g72lzD3aJqot7FLQWg=; b=
	bai9tG1zDY0suc4xGLSOP1BXIZWsjzOPZJ378ur6a5Vzue0j1KiUXX92wj2FcmWX
	4LFQwOZDV65hHGHAhRZNO+24/urkA7OSV3ea8F8prJU2Zigim/OAAubkj6Keb9Rd
	oDPN3TThCjZ5fCB5jpL3Kfk56ssOxiAa4sY/2CoCLHb1OM99Ipd+yRCJvjRgOkDj
	s/nBL77DBDopetNrl/d3N68OKW8CfOGnMvd3d7ouLuEzGCg08Idx0WEz9v71H+HG
	112EFbg7ReP73Y27dovdZ4nLuR4ZOZU8SOEptSgoPN8+PylIcUq5E8TjIW8Wkc4x
	bigGBKIlrPwM2r8NYoGjew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781011517; x=
	1781097917; bh=JGqLSUHMGrATPT+jYKhYD8UW7g72lzD3aJqot7FLQWg=; b=J
	rGtkjA0n7vKr3prxXunRreKsNMMGN4sZdMG8i15VdVsljZtGtq8BEIBhXcHRg0xJ
	Mkqh707HdChSXBVGE3ZmadRtTUODs3pdM8Lk0zp7Hare9TGC7OyyLGoYVC7w0e81
	0+10PuoKgH4kEgUxuNo7tEMGOo9HPD7fyUijHKakc5yzDijrsfxzNHxr0ZrQCIC6
	fDP8TRCI2zTdaM1Ug22pXttPPXRPOwWS8fvjWTbZruc8Q3mmzBJcLnZzPmMjOTW7
	f/ZAGoqYXgg7ahv4PSDDIf7fxc0BXq+lJSWjnbIV0HF6Q1m8SLqJbrg3zUMfIMYa
	iSa+vUjmJwiChZoPiubCg==
X-ME-Sender: <xms:PBQoalySK3aGwQ4qKFjTiPibZ3AaM27fPG7nv_8tKc0cknB8WN_0Fg>
    <xme:PBQoagHNaga0aIoU7HeabYEswpUBTPDhGKKMB9bbEtFVppC8eJe-Fe8OTDkHjGQ9M
    OITy4G-hZWaHvzeL7EhvGNBHnL6nygHRv3fU96MfXR8QlE-LHoAXzQ>
X-ME-Proxy-Cause: dmFkZTGtDpmmqoVfbHshe/GUl4vxwrhmR3uE88+49PG2mSnnxVFhi4azEwaA/T/pbhx7fW
    94SNaqBYBaPTi/WA17tT+vXokIGOVe30XUtprKU0Pie4wSZwE9uoth/TKnZuOuUDTROf46
    EPFaNLzsKxt+/U8JYMV5D1d+T54ve9UDbRfuKSuSfXuo0aBFhZvUEdnQdMNMM69lh8cbUl
    1qZIy+JKNofuEfl/kL8scEpjULVxKUGMc001RVWwzLPO69go1Bf6HfoQqYzSyCO5nXGXEi
    8woC0VoZM5styGPHdORTUrSEDd6SDg/81zXqsLnULnvjCmjosrpGpmTnEpgU3Hmvmt0lLt
    /Ndon63Z2i/D60XQ2jNiE5YerAk3xGorkctqFqQ77MXkRRValthqC+7LjDmojSFfoNHFRS
    7sNtxxEV/3ujtysXn3lj5vsoJCxOMKMy6rD39/qcPbyoqHMrjYpt85pZu7qAFQvmOjC68C
    jArwes5YNtQELKiEVstjjN1D6jHBmTyLAvN69Le33jSkAXh7fRi92Frw3UyfOr88yE89Vz
    WOsXiD+I+XfHRHpbRgZ48QY3zOuTVQhky+/nFXiAyu7g4G6xVkzXb1zzVIygk/U0xn0nMN
    b2pdp80S5ytdhyhlO3POd5HoCGRpxbq0DawzU12zZzCOlRbH9Van6Qg9hniA
X-ME-Proxy: <xmx:PBQoao97CWiJ9OP4ZcHAz_NATMQCzwyY5EpusLbG1NWBTyuYgGjY8Q>
    <xmx:PBQoappv3L5z0TuY5xQ3MKSDX-33o_CYZqgm5jMFH1n2M7cqT3DW-Q>
    <xmx:PBQoapkoURRYNNcHQZMze9I9L5b-BXYRM8JxUE-4L-QtElJTk8rgKQ>
    <xmx:PBQoaogAhaPjd1uJvTze6RsPsoBqIjAx8_2c3AnYxSrS5vTmB8Q9aQ>
    <xmx:PRQoapBFmEAGYI1fVPruCi8kGAS7XRgrzjk8IbpjHKEPNR_U2-UpAQ8P>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2246B182007E; Tue,  9 Jun 2026 09:25:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AWnOTg1RWIwJ
Date: Tue, 09 Jun 2026 15:24:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "gordon.ge" <gordon.ge@bst.ai>, soc@lists.linux.dev
Cc: "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>,
 linux-arm-kernel@lists.infradead.org, bst-upstream <bst-upstream@bstai.top>
Message-Id: <731e235f-96c0-4233-b316-c7887fb99bf9@app.fastmail.com>
In-Reply-To: <20260603.193147-gordon.ge@bst.ai>
References: <20260603.193147-gordon.ge@bst.ai>
Subject: Re: [GIT PULL] arm64: BST C1200 eMMC DTS + defconfig for v7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jun 3, 2026, at 13:31, gordon.ge@bst.ai wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
>  arm64: BST C1200 eMMC DTS + defconfig for v7.2
>
>   Black Sesame Technologies:
>
>   Enable eMMC controller on BST C1200 CDCU1.0 board:
>     - Add mmc0 node in bstc1200.dtsi (DWCMSHC SDHCI controller)
>     - Add fixed clock definition and reserved SRAM bounce buffer
>     - Enable mmc0 with 8-bit bus on CDCU1.0 ADAS 4C2G board
>     - Enable CONFIG_MMC_SDHCI_BST=y in arm64 defconfig
>
>   The MMC driver was merged via mmc-next in v7.1-rc1.
>   These are the remaining DTS and defconfig pieces.

Hi Gordon,

There are two more formal mistakes here in your
pull request, please fix:

- keep the defconfig patch separate from the devicetree changes,
  as we will merge them separately.
- on each patch, make sure there is at least a 'Signed-off-by'
  tag from the committer (plus author, if different), and
  ideally any 'Reviewed-by', 'Acked-by' or 'Tested-by' tags
  you have received.

        Arnd
