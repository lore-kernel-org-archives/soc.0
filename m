Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D31833FE0D
	for <soc@lists.linux.dev>; Tue,  3 Mar 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525727; cv=none; b=fGcCWt+YqPpPdlmOQXPCy2pPv1qVFueTFGdthafoZutJ/koFgoApAZ95tTPLGyeW5Vfe3B/8cVbar5ECdMooTnrZn43DTNpD7qTI5Zu6jVMFvZVXyYsaZhLuxDpeaYy5zia0OpQjlt4//DBq+urWd6wYo5E8T10ZTLrO1sLuPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525727; c=relaxed/simple;
	bh=9wxhZFyadDWhgu+mqTQiylyLBH3aaNALj+RSiOFtSE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqUG2xufobhzH9PeklmSW5czztPBr7NX6iKid7fGdPpv0QNCbBDChfqj9Sg2DYUMJPoTIXsgOf2twRWOgeCZdSFFz3Lr7McyXXsuh8iSywDPto3ALT9Xbu1bJnZsS4Szb4RP8XLCLF5U+/EPIt6uzkpO0B6eC2/zEeSPXSVvZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbWvOqfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbWvOqfZ"
Received: by smtp.kernel.org (Postfix)
	id 194D9C116C6; Tue,  3 Mar 2026 08:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04197C19425
	for <soc@kernel.org>; Tue,  3 Mar 2026 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772525727;
	bh=9wxhZFyadDWhgu+mqTQiylyLBH3aaNALj+RSiOFtSE4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gbWvOqfZGi/sQQOlsps+QVv5azJZZ82cauOxjbVrL/wRL3SQ4tlsL7ntDW0IL+0v9
	 dsuuhfHeCDjbriFR7UmHxHZw9N9f8dbnDLCo9c5bUNAKXVlNSrjCRwCUKZjtxmHysL
	 AIHOKrvJPOgo+55nr3CKqo0S0DlO6Jxq+I+7XH8+7SPR4wj78gdVDmG/nVIa24l+s9
	 8eiA/GX5tUY45dqmQhe6TitrCv9yheJN1b5dTj8GzDNO9UPBIAcztxv4QIgK87de/x
	 w2piZHoHhKRreVSHZ+nxa0gW2Su3dSR+lm8JlgswfCjQjy6JQl67XBuzfuP+/KOCBy
	 KWU/TXNx8OvCg==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64acd19e1dfso4697379d50.0
        for <soc@kernel.org>; Tue, 03 Mar 2026 00:15:26 -0800 (PST)
X-Gm-Message-State: AOJu0YxqtchzVQowfIwN4TfdqTtI/6SmtMG8kibz7InfzCaLW3YscXDf
	DC88MIkoJvG6ML1tDh30AAaGrl4QyOa25+9zcJnDSapsWKToQuDSuuDgYwPVb5QcQHGyNWUQ3K7
	5UgP2ayWDR+kXWI2XaSufqKAM7SEiIZ4=
X-Received: by 2002:a05:690e:e8b:b0:64c:ed24:13da with SMTP id
 956f58d0204a3-64ced2418bcmr1143119d50.57.1772525726251; Tue, 03 Mar 2026
 00:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260213-stole-economist-d5b0ac711d42@spud>
In-Reply-To: <20260213-stole-economist-d5b0ac711d42@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 09:15:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
X-Gm-Features: AaiRm52G_V9-_ujFenWeUWpFlzIbDTP9l4vvm7MAbjZjHcSBGU3uCwJQd8F52m4
Message-ID: <CAD++jLkDHh_WozDAot4c=1kYwy24sjH9-5_i8-Vmi6oXLp9wUw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.0-rc1
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, jonathan.cameron@huawei.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Fri, Feb 13, 2026 at 1:20=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> Conor Dooley (1):
>       riscv: dts: microchip: add can resets to mpfs
>
> Felix Gu (2):
>       cache: starfive: fix device node leak in starlink_cache_init()
>       cache: ax45mp: Fix device node reference leak in ax45mp_cache_init(=
)
>
> Zilin Guan (1):
>       soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe(=
)

You have DTS fixes mixed up with cache/SoC fixes, this is
a bit unorthodox, is there some hard dependency or can you send
the DTS fix separately?

I guess we could also split it off manually ... I'm just a bit insecure
with that.

Yours,
Linus Walleij
