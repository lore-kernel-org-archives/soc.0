Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91373596F6
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 12:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085502; cv=none; b=attb2sRT9Y9Nua6JXoH5VFZ+Je2ysU/Xa6PZLpcwnYDVdd+6hlhqj2oQ7m0iMV9vvjVPfgXI+SD/H20lIcqbk1bWLuiKXMlmPntEMQL8xDIQclfKKhta/2Rlf3ZiEZKeInhReF07nf0fBiQ/uRuAxohHaKSZctmDpQDlECLG4xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085502; c=relaxed/simple;
	bh=BZu/5Fim3WbSmBgZucW+Oc0ZzQIc/F/G6KlUlmjvOc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlTDPMecBlf4e3MtD56G9ArdR7WpC/bjqjY07FMKYAgcq9j+PqSunxFlY8v95FDbhAE+MO9WfF1EgaQVYxw5dCtT12nDboEfIsY1qv2MtjqHkRM+pWK3Mi4h06H5TnUmTyllhc2a79KkqWC6Qss6QvclLvdGpLKVVqY/2iHk2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45c70afbeebso539164b6e.0
        for <soc@lists.linux.dev>; Thu, 22 Jan 2026 04:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769085499; x=1769690299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NshjYFUffTPn7Y/VWXqwFCdDoXaersEomkK4SDzB2hg=;
        b=E27QU0xyPGGeYTDQMUQOTGFvOqccBO5xjTaFMEvaFjW7uS+//LjpthFo59NJY6cERp
         dOntFz/TKqUvlD/PlS0PEjdrpw2TIZdt9DQNdpRqD4m/sW4n8ndxSDEnf0zeZREHdaji
         vbajLhgcEwKy28BgGvTbxE8Ng3oyiOtVELt78XxDV/5aDZ6WQLKP8brp8flg80LiPLiW
         cimNX1on64CWl6/PZN8nEux/RDZ8lN1VLY8lBXJNFzYBbBhoWbMrD5dt98T+bq6KrwM8
         14tP4J2zxZRsbtEtzeP4B33cp6X4yER6aa84rxHedVeTOhNRsWKhwBhlclffeecyx8Q0
         aKPA==
X-Gm-Message-State: AOJu0YzTrKQy0xP4GtkLDKty2n+NVIEHiGXfbfpZQ92e225yD7W2xjMV
	el2WiFwJikWHKhQ/bwJ5hN+dg8rcaugsFIDlcDGN+3OXrwHAgrOowU8QIdHsD4zT
X-Gm-Gg: AZuq6aIxADtuRK0AuYDVge2Goz/SSuM4YwnkBeXo/ApK65Y32D3C+PLDqjXODgpac2q
	lfh+74uXVcR0PkbfD8b7OLwBmgXP4K9sPoZrdMEfXKpxZeO41STN345nmS5yPwJzm+AKEqc8wyz
	s/n+S9mNfHVbXNiyxpNkihMqzWg1GrnqEcjURq4LeZoGhrE5KDVbR8KTetGWp78PSZexVRpaWqO
	sE53EAdawLeFjnl7CKqIokz2hyJq87WYCmIQ6Dd56IIoZaaBDUtlHFNyhOVuVvBWfIdVKDed/gi
	9vZW1flR7eARRZFUborubKhGXNXxdcaTBxAxqVkE7vdo73QvGb6jl2CgSieRkQ2smRK7RndmS+n
	Gzpr9L2x3etA5p1RVkJHRTjMhtngEo2fMo/1qLO1E7kZuhLqMkLPpOPcTDtfv8Ygf6Xa7lxnhVD
	4VCPc4zhL5kYd7kpq4byoSSFKJMMFyxQ9q3AjEGcGFWuXkg3qw
X-Received: by 2002:a05:6102:26c3:b0:5ef:b033:8abd with SMTP id ada2fe7eead31-5f50aeab1bdmr2298993137.45.1769078726864;
        Thu, 22 Jan 2026 02:45:26 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94808c00a92sm1431781241.1.2026.01.22.02.45.26
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:45:26 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5f535b24326so186675137.3
        for <soc@lists.linux.dev>; Thu, 22 Jan 2026 02:45:26 -0800 (PST)
X-Received: by 2002:a05:6102:304f:b0:5f5:3719:19d8 with SMTP id
 ada2fe7eead31-5f537191b24mr421545137.31.1769078726495; Thu, 22 Jan 2026
 02:45:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1768559762.git.geert+renesas@glider.be> <cover.1768559767.git.geert+renesas@glider.be>
 <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
In-Reply-To: <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 11:45:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHJY1774N5m_S99u6ETJdyuj7GdrXv75DRoDty9j8tcg@mail.gmail.com>
X-Gm-Features: AZwV_Qh9OPSpjre26zYtA49UvfUvRCXHMaoKfRQXbtFLez-kbSzjI0P07of02JY
Message-ID: <CAMuHMdWHJY1774N5m_S99u6ETJdyuj7GdrXv75DRoDty9j8tcg@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] Renesas DT binding updates for v6.20
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 22 Jan 2026 at 11:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Jan 16, 2026 at 11:50:17AM +0100, Geert Uytterhoeven wrote:
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> >
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.20-tag1
> >
> > for you to fetch changes up to f3b795d298a280687ed70211d51043ed5fc7a96a:
> >
> >   dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 11:56:09 +0100)
> >
> > ----------------------------------------------------------------
> > Renesas DT binding updates for v6.20
> >
> >   - Document the RZ/N1 GPIO Interrupt Multiplexer.
>
> This belongs to the driver patch (see submitting patches in DT) and is
> not supposed to be separate pull. If you wanted to share with your DTS
> branch then maybe just pull it as dependency, but the problem is that
> Arnd just merged all driver pulls and this one was skipped.

Right, in this particular case including it with my drivers PR would
have been more appropriate. Sorry for missing that.

> I'll leave this one to Arnd to decide where to pull this.

As soc no longer has a dt-bindings branch, he usually pulls my
dt-bindings PR just before my dts PR (which he also hasn't pulled yet)
into the soc dt branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
