Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9DB33F59F
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 12:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780403391; cv=pass; b=C84OayEs9EH1HTpxCIKOTUTR0Z1kVNvX4aA2ipbEd4D7J3UeV7rewKySDYq7LE3/bHgXAcVNPhi5607NIoogOhTPNRBYkeqj8XpfhO/oe91JOFcl7QSfiBwtPupwLvHjDaOXemaiWKye5r1Mf9NSUbLk0HMTRLyL4lt1RcsH3wM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780403391; c=relaxed/simple;
	bh=qJrNHNlupsKMDi8uQeQXsn4viEFpt1pbE534sYl2NtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8olXg0js96CZCZWwTOMtkIQnAS2UcSGDjTRRb6XMw2q1Uj5YhFcgtffI0Ej83EcHPieYhkUYm7PJ97sPpHoLcSvBeFQa6khtFMC0sNW7bNUPM4I7KuEz4LI3M91l5gQd3W6bBCPnlsBgt0wtzjT6AviyHZ78BAoqU547NyM+3k=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=aNhzpIHs; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="aNhzpIHs"
Received: by smtp.kernel.org (Postfix)
	id B50591F00898; Tue,  2 Jun 2026 12:29:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780403388;
	b=dY7qcXZWK4UrDKqLhu859L91Yi0kI0JjRZGkDXeoD0ryLLWwqp21ak9qOH33h3KqMzUo
	 uaGqXbBNDykw7HtHBgqmvK8FxAO/cm6qAi2oCJCOE5/SBJ9O+7HBQELl4SltX1tLesQ3K
	 YHfxN4JridAo2VadP7/KC8DCSIAKy/bgmF0O/ZKV6otfYGJ2HpA6GArgVl7vlnbljgyiM
	 b8K5njn263DBhZhMDZ6K3z8apertb4S8J3gjmj/l6s47ySyPyBpfVVVQZxIS4sfye5uUK
	 UH26AChQLUCTHHEzU8zbkJIONjCI5XTR6NbNbILt6ogfXaP2LDMRONJy1H08vA8D0OQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780403388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Nwq+o+exdFpdWZlTYa9XUsNAa5XkM2eHcSo77b0KisA=;
	b=IM0JRiQolM5oysU5U2sXjqa3U0kQe5bmD2zBW31crDdzxbsL25yCbRb672NuhGLYv9LI
	 3682zPU/tINUBJCbjPDA9Hiif8hXmKoOVWLDO6rgrJA3fCdVlI+POjx3koIO7PkT1RNgw
	 vqpxVKs6xvCE+Jb4LxB7dcoB6q/CLRlBsQs40LCnegsqmYFC5o3lG5XZy3+Opeba6JXgU
	 3G7c7R6wXdV8adp533c3AM57G/4n15iiRRMTjP/klkvjfBeDWdB7x1G/6tLqacji1++kk
	 S123RUXWXE0OFEfkcayeLhHDOSTlg9k4vKsYXa6gdNKKntZJr0gkJdSRhb/tFTfyYiA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=aNhzpIHs;
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D2F61F00893
	for <soc@kernel.org>; Tue,  2 Jun 2026 12:29:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=aNhzpIHs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3D2F61F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6603e24a7f9so4923820d50.2
        for <soc@kernel.org>; Tue, 02 Jun 2026 05:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780403386; cv=none;
        d=google.com; s=arc-20240605;
        b=NsnPQFfX31Lp6iDlFvmgEBvfb0WINQajsTARhrL3T0azLKVs1CAq4fXOhi5XoQLqhp
         Dtg5+14a0JyIast+KV9jULxveHQ7OBXJCXb4DQcIQiFtzINfwWrbIMPDLfYCnCIPXkTo
         nNOji4gSH98Pqs7SUnXdd4HrrkeEuw6GMaQRNT3zoTAfpISwC8Oi2r/gdGRZcZkxmIaL
         qZKr2TsPNEuMVijuiBywPn+00O9VKVkUSuWO5wpQ21WXd2PV9rwPWK2WMVdLyvy2HvC/
         WZ1OQfdkMeOq7ThfE4gdMFN0vvZyt4+RGhOt4W0P/zbdgOL6UCiZ+h9BqGeoovmvkrEG
         hZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nwq+o+exdFpdWZlTYa9XUsNAa5XkM2eHcSo77b0KisA=;
        fh=bs3v2HfsAanL2bQQ/nfgMMAb4LR6Z1jOsS0y+9U1ZaQ=;
        b=bEN+uQjqrYop1thfpadTPxApH2ipmn/vHLodt01Us+qwd3G3BQz+IdDRwfFDosyLHX
         0EU9yXD6+95M+FD8JaCXSnpkZ43UJ85lx0F1xVDXLJOZBQoOhTLCgFGEvYvkPTLdO3wS
         +pbx4L6qcR1PwLVPh1mO2XrhP2HFWY1uzayHmkPPhdLv5cJoo08uAb/uxVo7Zmz1hrZ+
         1dSPSadPMxWDiCRcD0AjBe7AjDNzJp/2scUvGlBpVKoaOquCAuoFnjG/67+sQFupahEY
         zPBSh0xlkQ5rzv8V63z4/LfNFXVuIBJs1kXI67xN8c7UfKG9dEVJhPQ7R7TU58foRFAt
         bhaw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1780403386; x=1781008186; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nwq+o+exdFpdWZlTYa9XUsNAa5XkM2eHcSo77b0KisA=;
        b=aNhzpIHsW5Dnxlz0pb3iez9QASNBcXhTk6cEQV4WOP8wS8kZfGTY9zVySixTGMGm6N
         Z0tE5xjsg0+FKPcecTSKzSAuRIbNo6dYJ1dvfhQqPd7fT1pWZT3PEn01/vPFnvxK+HZy
         uAIASIEYSOecvrHUgAD43b0SqMvYamDhF93F7gK7EspxpI1P7T+FH1WJQr7oApM1yGeG
         t/K6FnVFP9vedLDS0CDtCZVVf0h86fFpYIMczkE1X9Oi2ZEnP/ci0Z3pnCDvo6QejcDi
         sQLwr+bDRA7jhUuJLmdofpeDybLTFcYKB9TMcmglAB4nbbUh1HnbD5oMEQUIDlobLgxD
         pWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403386; x=1781008186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nwq+o+exdFpdWZlTYa9XUsNAa5XkM2eHcSo77b0KisA=;
        b=XtZEg/adU4dZ7fqsGkubR6viRqwskY49U1xWRaxTvObZhGO/+mWOMuM+9jnr/gJS4e
         VBS72eQ+MTWap6C4ZNYn4Www/sZ3+5Esdu7+byokEzWzvG9o0We5mluqaBN4ztcxJsGC
         tL0u5brIxtBBWXAjDwpSVXT2pktM5uAeillkwvWodCSF4pfZdQnUY+iTiFMxRgOEcXe0
         +4MwL6GnDNrdp95BUWBcldYbEgUaz9/x799FvYc1opw/4KfxDCjWhndZG0hOFd/jKHXg
         aCH3yG26QiZAF45Fg1o/DLRKohv3/bf1HIixPfZxgGAgUo17vTG8QjOsfQFu/syo8zYP
         nHwg==
X-Gm-Message-State: AOJu0Ywe7LeiQIY8JYTDXVYq299ZXZAheLuDmf6vTvucDzvwXTvMAVfT
	fN5Zlhp24Y2l0ngfmhmbqr+2JLZpV8InOOEaf6JtZseigkbpAvMEOHLwzEW0orHtC+usqZbtPWt
	DwJJSJkQ1nWmVsY4pSezBby1siE5gXM+lwQAIJKcy
X-Gm-Gg: Acq92OF78kvZ3e09kU5fL8xERWEJx70KnrlJLz37H/RU2Id9412eT81DAVLSn9630cI
	2HhinJiTA+LpXCZx+IiMAcidxSpr3PbGDYcdktRWYDuZtXE7YD19MeFwtioKUtuRCTbPVBPBiM3
	6GtIenq4YINi9JZJFpD0ATSoVwbeU7x5weAa0Tto75ldcy00shUmRb+nKXomLwoImJmVsXYxTSK
	Y4AmuC0bc6YoIgLni4MhhqCNT9M5KCQnQF1Fa9r5fFMkLtYd401n3Z5OXLasU95l0IBZuQxI9gD
	3gO5dDM62trPqltIOQy5NbvbGOARGeb2QDjMrdK8c25F5mZJGgk=
X-Received: by 2002:a05:690e:1408:b0:660:933d:3078 with SMTP id
 956f58d0204a3-660933d3864mr6493329d50.38.1780403385704; Tue, 02 Jun 2026
 05:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
 <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com>
In-Reply-To: <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com>
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 2 Jun 2026 14:29:37 +0200
X-Gm-Features: AVHnY4Lx1zOYFp-SLJbisxM1GPLQhmdA3CQJyn0wMc6eTpBydTm2Su5WjSb78Oc
Message-ID: <CAHTX3dL2W9iZDWLk=OVmno0ZUHx_EkXrJqskmpXCM_CQROWgEg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
To: Arnd Bergmann <arnd@arndb.de>
Cc: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

po 1. 6. 2026 v 22:39 odes=C3=ADlatel Arnd Bergmann <arnd@arndb.de> napsal:
>
> On Fri, May 29, 2026, at 12:15, Michal Simek wrote:
> > ----------------------------------------------------------------
> > arm64: Xilinx SOC changes for 7.2
> >
> > firmware:
> > - Add CSU register discovery with sysfs interface
>
> I looked at the contents here, and I'm not too fond of adding
> low-level register access interfaces to firmware drivers,
> that is usually a bad idea because it ties the interface
> to a particular platform.
>
> I have no idea what 'CSU registers' are and the ABI
> description does not really explain that either.

It is described in the commit message.
Configuration Security Unit (CSU) registers

And currently supported regs are described there too.
    Currently supported registers include:
      - multiboot (CSU_MULTI_BOOT)
      - idcode (CSU_IDCODE, read-only)
      - pcap-status (CSU_PCAP_STATUS, read-only)

multiboot - chip can boot from different offsets. (spi in 64kB offsets,
fat different boot image name).
idcode - full chip ID
pcap-status - to find out the state of programmable logic.

> What type of userspace would access those, and why can't
> this be done in a portable way?

multiboot is useful for A/B updates when used. It is also pointing to
where the boot image exactly is.

idcode/pcap for fpga programming case. That your bitstream matches the devi=
ce
you use.
Scripts or user programs can use them.

IDcode could be the part of SMCCC_ARCH_SOC_ID but we can't change what
we have done in the past
but we plan to implement plat_get_soc_name() which will also contain
IDcode. That's the one
where a standard interface could be used.

If you have any suggestions on how to do it in a portable way please
let me know.

> > zynqmp_power:
> > - Fix race condition in event registration
> > - Fix shutdown and free rx mailbox channel
>
> No objections here, though they look like bugfixes that
> may be 7.1 material. Up to you, but don't be shy about
> sending things as bugfixes when they address real
> problems, it's better than waiting for the merge window
> and then immediately asking for a backport.

It is more about time not about being shy to send it.

Thanks,
Michal
