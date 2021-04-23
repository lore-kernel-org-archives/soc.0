Return-Path: <SRS0=UfjI=JU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD82C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 14:01:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2101613B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 14:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2101613B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Li1ccfwwQNj5aNzhqUz4Td7HJzcJPODCFQ/GvkLQ3Q=; b=aBQ6PruTR/KVW8CPIt6wZnpDJ
	vpa5OFtDZ6nSd42oovE1Ley27z9EXqOoRSeeUHHMPRi6CzZsKrw+pqfAiCcpJVAeEvRt3HeFhA0yX
	UoXZUH5aTyzL1nT78BUDNz1tlxz5M5vx8zdL/WBvXUaMaXNBvkKi3ZNWQ8a+OaMiVHmazUsRdUrZq
	ytjzFEJ+T1cKGjbrp1gwhqpWtItTNavkYtAWLyUuezcC+QxECEOBd74L35thdDIHqfEdwMp3AUMQk
	40Lq8Md3oFPDOkApHVmn/dZbJtDa/osLEZd1Wnr/dCJ2op3ns0LtGgVJpAmD8n/7cHwIb3YeAeRx9
	iJ6OX9UgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZwKX-001eGh-Li; Fri, 23 Apr 2021 13:58:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwKU-001eEj-M8
 for linux-arm-kernel@desiato.infradead.org; Fri, 23 Apr 2021 13:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kDRSwjYBqxLRtGd+/fhKuiDViOWHHmZYLCNb/2TmtE4=; b=EkjLBknbWPo2s3z00aoNqnj/oq
 xSwJVDHAcNHGRDnEK4N7QpFwh+HPZHWEwOxiRocCxT5sFLZq81eewiVM7xIXQso8acQvBdsnDoaNP
 IdT2O2RI8HLw0BMVIG3SBAMW/zp4cn9kMgPH1IUMXPiYcYU6bW6pbvSs6WUxHFawk3rUqpP7lyWpb
 VZs8XJYXN36aSc4h0Gn6CB7sILNlF9y/WIYH6fUT1Qk3HrnTki/hndBb8W24fg0knL00HRoc5cdv+
 jy4/qn/Arb87RwMeExTlldnTrMqwSVlPsNcDpCHRHfgQ4sPNmcKs5QXMa4H7UXrg22RiJvXFi6dHJ
 m93lv2Dw==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwKS-00ESMp-1G
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Apr 2021 13:58:45 +0000
Received: by mail-ej1-x631.google.com with SMTP id sd23so65394674ejb.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=JIHdcxDUgUMkn72ZZiGYLBurj81/UhI960gqaDhtFMU6NUuwroTmdLDOBE5sPisRzE
 wxKx9rf6cul5DLGQluP8om1G3rmuRzyCgYazXdmdgzZt0BQpo8sukwNegMfX/VTcBHYQ
 FevM6U2T1A67ok4ec9AUZbuSAgYXk08bT1wzIApRNf6M6fVeAH/6p3jG2FlKRLfqDVid
 eQyFUagtjO+oF00ra3Fjr3yUaVZUyUG7FAZbX1OVm4eVmrY7X0FDRZV9aSRe44gj2vm9
 VWPGWyx/WLuMwB6Jq/CarsjihKJUFSGtJPUK8uA7ZZKp8KJzvnGcc1H+ObQBMjz2Nd+R
 s5aA==
X-Gm-Message-State: AOAM533efKtXFBG7Cuef/ImK8tJ/Zp6Pydh14zvIoslL1ySYSS8OSuQn
 B89eVXJnM1nx82EKrssY7Vh2QwrHOPM=
X-Google-Smtp-Source: ABdhPJwsu72Mv2coSvxurw8CjwPEQuAQDalXXOJsMl3odOMj8t9ZdsurDvr/aK4PGr3lMlpyI1gcqA==
X-Received: by 2002:a17:906:7942:: with SMTP id
 l2mr4338605ejo.314.1619186322165; 
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
In-Reply-To: <CAK8P3a1fDD6FXj1gL8Gwb+03ERKhm6uT94Yt7Ne2aRghn539fQ@mail.gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_065844_102457_C9A1A4E2 
X-CRM114-Status: GOOD (  26.38  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8777606345752391010=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210423135930.LD0KxkcmwmeO7WLO9sBoVR9tUl4mGAornCV7ZWFPGlg@z>


--===============8777606345752391010==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oTZcgq8kA5gtkc1f"
Content-Disposition: inline


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


--===============8777606345752391010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8777606345752391010==--

