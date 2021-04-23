Return-Path: <SRS0=GGhe=JU=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFD7C433ED
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 13:58:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E505361261; Fri, 23 Apr 2021 13:58:43 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C60B613C9;
	Fri, 23 Apr 2021 13:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C60B613C9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-ej1-f54.google.com with SMTP id w3so74094468ejc.4;
        Fri, 23 Apr 2021 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kDRSwjYBqxLRtGd+/fhKuiDViOWHHmZYLCNb/2TmtE4=;
        b=cm5Duuc+rpNlUKAkROGRFCGlHtQwMod0+bqJpfK6++56w+APnVff9cRaA4mWXnev1H
         BpeLPR0ySpRxgX3DeCQIYJc8x8GPiNecFvnRbB/vf9Hju0/fV3o/sSAC8upVPMNm+xYV
         3/kcUPyhhOETPMgNAWOYDxNex5iVg0w9AUnDvQMnsEXcQg68A7JdZfu10eXJz9Y2O9HA
         7J7iO2I+xa6kbW5FG4tIjHzp0FuCZ0ypJHJ75L5N+ft2xQmZJHMsnWQN0eiw8K8Kd5gD
         hTko5fnRD7b6LTU9DlCI9GgOwfjB8joNhn8IBTCA17opN3ZK8LfMvc09hzAteHuuSVDp
         j1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kDRSwjYBqxLRtGd+/fhKuiDViOWHHmZYLCNb/2TmtE4=;
        b=RtiARnwF9R2ktjqHH6yekHq56ccC5SWGRNNv/0kwRT3V+7gtBKZTbk+aUk+Py3JCl2
         WKUMBvXjOomNdN8neL10hMvfHo12cqc5NbkgLMFVMVxp3O0NQzP+e5YRBQh8hMRyE0MK
         MusgtA1iwBTCahl6sGcOYZgJb7hP25AA0qobNR6NRaiNBRA4HU83gZdtNf6XaI8ayp9J
         kvIwS6+6F9vr1rrxPRLw498D4YN/HD+UlyF9g++W+XXdB/wgMFFRTCuPS9LRCT3Nx3E2
         EmOHtqTypVmlwGvtB1ZCTpI8nng6GveXRRy4qt63kSAO0H9aW9pfPaCSwH8Wr6+362ak
         inkA==
X-Gm-Message-State: AOAM530AOwfGkMpAdwLTHyalJoqWcZIwGtcXfNlBdqUQLTENDkwseGTD
	/IdBxaITRSwf4SXkOkSBZm8=
X-Google-Smtp-Source: ABdhPJwsu72Mv2coSvxurw8CjwPEQuAQDalXXOJsMl3odOMj8t9ZdsurDvr/aK4PGr3lMlpyI1gcqA==
X-Received: by 2002:a17:906:7942:: with SMTP id l2mr4338605ejo.314.1619186322165;
        Fri, 23 Apr 2021 06:58:42 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t15sm1065509eds.34.2021.04.23.06.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 06:58:41 -0700 (PDT)
Date: Fri, 23 Apr 2021 15:59:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
Message-ID: <YILSwt6e8v5PUvFP@orome.fritz.box>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-5-thierry.reding@gmail.com>
 <YILD4yyPXuiYbHW1@orome.fritz.box>
 <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oTZcgq8kA5gtkc1f"
Content-Disposition: inline
In-Reply-To: <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)


--oTZcgq8kA5gtkc1f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 03:42:42PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 23, 2021 at 2:56 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Thu, Apr 01, 2021 at 07:26:22PM +0200, Thierry Reding wrote:
> > > Hi ARM SoC maintainers,
> > >
> > > The following changes since commit a38fd8748464831584a19438cbb3082b5a=
2dab15:
> > >
> > >   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/=
tegra-for-5.13-arm64-dt
> > >
> > > for you to fetch changes up to 405fa9e9d8664e830982c5fbcb70f9ba8656ba=
fc:
> > >
> > >   arm64: tegra: Move clocks from RT5658 endpoint to device node (2021=
-03-25 14:04:49 +0100)
> > >
> > > Thanks,
> > > Thierry
> >
> > Hi Arnd,
> >
> > I noticed that v5.12-rc8 is still broken because of the missing
> > fw_devlink=3Don patch from this PR. This PR was meant to go into v5.12,
> > but it looks like you pulled it for the next release.
>=20
> Indeed, I never noticed the difference between the subject line and
> the tag name. I usually go by the subject to see what branch to pick
> and only then check if there are any discrepancies, but I missed this one.

Oh yeah, that's even worse than I thought. I hadn't realized that my
scripts had named the tag tegra-for-5.13-arm64-dt.

Next time I'm going to take a closer look at the tag name and also send
out fixes PRs separately from the feature PRs.

> > In retrospect I realize that the way I sent this out was rather
> > confusing. Any chance you can still pull these into v5.12 to unbreak
> > the final release?
>=20
> I've pulled it into the arm/fixes branch now. There is only one other fix=
 in
> the arm/fixes, but I should still be able to send it out tomorrow.

Excellent, thanks!

Thierry

--oTZcgq8kA5gtkc1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCC0r8ACgkQ3SOs138+
s6GWFA//drvnY41GLkcseuGwYzvaJecOwpaAn1MFJK6DHVltuSalxubWeuNXoXcx
MwMzJiskfq8cwdeYN9ZADgYMn5gcpu2wjg++Uj/56jw+1nxzRmTV9bE9a2likeDM
QypIG340om9ccFWjEEejE5CkJ4e0FtgiYe88DYLrXZZxCUYZ6v4SCGrJdneIUYtq
eo+m90BrJ7ARJJv1UnfbG0430FMWlT7sxL70+m0IiMj6rxzi0/FrmYzBk7YBAneB
5TB0KI3E6eR3DzcOf0SPXyAttskeoTITBEz8+9+Tyt5iJoeHJSju86RZv2OrQrQr
cJs/qn56z3zgHQTevCfFyqZ/Z+GGrjzYkW812zETGV2iRUvPngvDFCqGaAnckp+Z
vyurQLW1WtYZNOMJCpzUpPMS4YbTL5yf4JDdkOJeyrgVNpc8IY9Yuij2yxG2AQwE
26uwUFg8EuD+jjAM+Di3mv350sz5BIzKglwAXY01jFMpLodRSsKgne0kC5Drod/d
ihz/XCUo/aOx0twTJQuJo0JpMBOt77PU6r/1hXCGWZ+2gKVpG8+R6RYdrIvwWOLg
Tja71EADgTf0ru81GCO9tsNKkvPzif6UHu3B5N7Dnmo7QblfACAVjrgBKA4z7iHz
VlGFaaA75whYNxZyL7WPOVSNkmJc4hvWjM4VM9Ov3hiN+QHL/Jg=
=UGiu
-----END PGP SIGNATURE-----

--oTZcgq8kA5gtkc1f--
