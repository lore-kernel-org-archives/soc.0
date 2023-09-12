Return-Path: <SRS0=2AXR=E4=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4EEEE49A4
	for <soc@archiver.kernel.org>; Tue, 12 Sep 2023 22:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD28DC433C9; Tue, 12 Sep 2023 22:19:52 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A353AC433C8
	for <soc@kernel.org>; Tue, 12 Sep 2023 22:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A353AC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-58fc4d319d2so62278997b3.1
        for <soc@kernel.org>; Tue, 12 Sep 2023 15:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694557189; x=1695161989; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1tKmGVB6Mvfy9DEZwN7tyTLoBZ0QSjfmL2YVCLgau6c=;
        b=ZLZL9AWsMqIHlI4nmp8pUhWXVlRjZLDRtah6JXFvIBqHp7G0JoWGud4A1CObFGz5pu
         mMmPq/cBrMxL/oflFIcEs9UE8lF3R1XWNxyelQOCZMLuFycAUrvA/xSIu+0potju0CK0
         Z76qZvog6gRCz6eiHvsmgD70UTyIaaI9pD5TtiX/WVIPtv1AgstnI4r9tzToPiBA38Qh
         lGTYYEvGylXKeCA2rtnIpdB/qMV5dbX1hkMgqu4FyuUyju9mjQSqS6hnhDSpCWtK61pC
         lUTSlHqwIWAKPviFfHJSjWwHZ+a70XoptMXK5lSNmpyt//aJX4cTLVWq3KzLOjfy9bV3
         PSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694557189; x=1695161989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tKmGVB6Mvfy9DEZwN7tyTLoBZ0QSjfmL2YVCLgau6c=;
        b=W9oZg/MTjRwjLrIWpfgK4RhzVTj8ToBE0JcqG4nHU8vz3cNCfJ+fjJ1k54jUFcJYii
         f8+1a8h/d2zbRi/1bV7lHRzX244AMv2HuzEWoJ0toqPe7RsuonItH2xyacHMwb2+RSAV
         xLYIFMiPW97rmkcY2kq0Y7cawsrKfjHtoC31rFdV719MQctqzx1XwpnjbHq7CKkXZrmj
         qrgDAGC6WMjOl2n6MMMy78dktN50E7kclUE+TArCsKUqVyP4YorhX405rcLwBC3UKsD9
         vhoQxYIP/+SlVcuBNQ4vg4lYHYtw2cIEf4/CNzex+xD4db6KmVGOPExejkrxBbr2cp+c
         Gmvg==
X-Gm-Message-State: AOJu0Yy/laMm9X97nMSQcPf2OkZFjF9A46PhWzRSlo5EggWKnmpv1mdm
	mazRBBeYgi+lS3SkbWoDTRkzDo8IMPFpJDhOd5ElGQ==
X-Google-Smtp-Source: AGHT+IFiLeNSnjgZpmmgdTv96jm6J2pT52BayzOGIvFNAoKpcvCnfMU0seLr8MHIhNzj8YZ96QniefWRD+waffsjE+c=
X-Received: by 2002:a25:ed08:0:b0:d1c:bb1d:238a with SMTP id
 k8-20020a25ed08000000b00d1cbb1d238amr586222ybh.52.1694557189538; Tue, 12 Sep
 2023 15:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
 <CAHk-=wg0gc4Cc90OL29Vr5gDtd4mnsKD+TxtoNtQbAryaWHkZQ@mail.gmail.com>
 <CAHk-=wjLO=Jsdk2prq0piznMMCk+V0_fRaFRHEPuaALpF8J=hw@mail.gmail.com>
 <96bb0de0-06d9-46f8-b02f-dc924afff13c@app.fastmail.com> <CAHk-=wi5Lh-NG_rvcx3Zyqd2Uhj76G4V73tWCFULhVzOU6e1xg@mail.gmail.com>
 <CAPDyKFrJH-1uaPCwnWZDPi4MRtOm=N2CHSRyvjXRDbQ1y-oOrw@mail.gmail.com>
 <CAJZ5v0hqWYnkNXVju3U3n-9i8eqtjs197tLLNWv8Qa_N9T=KEw@mail.gmail.com>
 <CAPDyKFpXLj_2HAgyV_VJf+GPQVmxb_iiDe77Q2MY17MDNqy9fA@mail.gmail.com>
 <CAMuHMdVxLkxN0bmSRXW74R_dGNDSRDB4Z=zE0DoiXDOuweSM0A@mail.gmail.com>
 <CAPDyKFpUUJeGD77GTYCk59cvW=SdGTkOEXH4dap1JQWekAa0Eg@mail.gmail.com> <d1d6b2a2-8be1-4269-a504-5762b94df77a@app.fastmail.com>
In-Reply-To: <d1d6b2a2-8be1-4269-a504-5762b94df77a@app.fastmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 13 Sep 2023 00:19:13 +0200
Message-ID: <CAPDyKFqt7UWHoiTGsg_PCdU92iFgh7p25FtCkhf5bU_0sDuD=Q@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Sept 2023 at 15:58, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Sep 11, 2023, at 13:28, Ulf Hansson wrote:
> > On Mon, 11 Sept 2023 at 09:52, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>
> >> And I just realized you moved the code and Makefiles to drivers/genpd/,
> >> but not the Kconfig symbols and logic, which still lives under
> >> drivers/soc/.  So resolving that (and the name) is something that
> >> should be resolved sooner rather than later...
> >
> > In regards to the name, I am relying on input from Linus to make a
> > final decision before I send a patch. In regards to this, I have also
> > started working on a documentation patch for genpd. It needs some more
> > polishing before I can send it though.
>
> I'm fairly sure that Linus was instead waiting for you to send
> a patch or pull request for the rename. Please just pick a name
> that you like and that Linus hasn't already objected to and send
> it so the rename makes it into -rc2 for others to base on.
>
> If anyone has objections to the new name, you'll find out about
> it then, but I think we trust your judgement here.
>
>      Arnd

Alright. One can interpret silence differently. :-)

Anyway, I have followed your advice and submitted a patch. I have
queued up a couple of patches for "genpd" already, but it's still easy
to rebase them after a rename, so not a big deal for me at the moment.

Kind regards
Uffe
