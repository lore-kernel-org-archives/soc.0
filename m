Return-Path: <SRS0=lJEs=GT=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A13EC41535
	for <soc@archiver.kernel.org>; Mon,  6 Nov 2023 20:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43AF3C433C7; Mon,  6 Nov 2023 20:12:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F917C433C9
	for <soc@kernel.org>; Mon,  6 Nov 2023 20:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F917C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cc209561c3so38595ad.0
        for <soc@kernel.org>; Mon, 06 Nov 2023 12:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699301569; x=1699906369; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCmxZQ2Oxpbskbwyw9Ua1r7xejTQmCxEQhy0zVHLh60=;
        b=tHEFcOH9yFrxIyPOPErr1kuEm4Ar6e/NOSlrw/PPD28Vz47BL7mSFUcoe08wdY9XMn
         dTECAPkiqYKLh2+HnzlNCVY94LIxf7/CyveTFKXLdu1IBPeVvUJsFnRzYx8vATcHQwoE
         qEvP29gVSAmvFVqellMWclBIiLW6eufCdiFhdT26x71QFbimnxjCtcsjnAzJq4lgiyIh
         2BGWwl9BtOcH91v1BP+WL7/BKff4rthnP6PdWTxZ3zbtpFcFhGOOJZPsU5Wi8lLwNDSF
         BrAaFRCt4g/JEJ9bF2v1P1eYeiaOQlCNcBRFDkFLNZAWM6foWAdNZH7MuMsWV5xCPyrm
         UFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699301569; x=1699906369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCmxZQ2Oxpbskbwyw9Ua1r7xejTQmCxEQhy0zVHLh60=;
        b=C6Aws/7QzMud9xKJdQmJKGgSAXwiw6aCECbkOEDMnJnUsv9cCfwqEpS4RTAw/fH6aO
         Uw6IOsRk49wIX5VyK9W7IBWaTzaxGxDFhsF4qXiioBJKju9um6NtAAUezV1qLCw45Ka1
         Ol50sVbB8I89BzOd91IT3ymTuawMHBNrFBSXfUrg6ChbjJi9zW8elESyZvXoK1cINtkC
         8QctejlP31vvoHqUfl5ZKGwAJ5C6h2SMIKS52NMkra2CLvNOGnfDflx8gofEwSi58kGu
         w4YyVjE+VWGInOBDw73y/d/7jam1t63SdaOwxFmCAKsP5KO+nYvYjFXHYqG0rqwX3H+4
         wmlA==
X-Gm-Message-State: AOJu0Yxkjo/v3DUDq4Q37jzeFaovEwOL3pM6BZ1r6i/Zq852BXeNWc2J
	LVUUNi7r0Rm7hxMIZsmUfs2uoA==
X-Google-Smtp-Source: AGHT+IF3V9ovdzJCx+/8U9FA7k02MzWx3cZN0Lltu+A21MD1EZIQSXCQqYEJNE2uO2Y145nAyeb2vw==
X-Received: by 2002:a17:903:2646:b0:1cc:38c4:5448 with SMTP id je6-20020a170903264600b001cc38c45448mr51121plb.22.1699301568966;
        Mon, 06 Nov 2023 12:12:48 -0800 (PST)
Received: from google.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id t6-20020a170902bc4600b001b81a97860asm6214888plz.27.2023.11.06.12.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 12:12:48 -0800 (PST)
Date: Mon, 6 Nov 2023 12:12:44 -0800
From: William McVicker <willmcvicker@google.com>
To: Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, linus.walleij@linaro.org,
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, olof@lixom.net,
	cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Message-ID: <ZUlIvKc0zf4jtaIC@google.com>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
 <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
 <ZUUvp3kqM7NPlyZ_@google.com>
 <ccb94ff1-d4df-4c18-9c21-a887ad701479@lpnu.ua>
 <1b30846e-934a-4ab7-bdaf-c4dba933bc9d@lpnu.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b30846e-934a-4ab7-bdaf-c4dba933bc9d@lpnu.ua>

Hi Maksym,

On 11/04/2023, Maksym Holovach wrote:
> I believe I misunderstood your point, and now that I'm reading it again I
> believe grouping device trees based on device manufacturer is definitely an
> interesting idea and it would definitely make sense for e.g. x86, where
> there's basically two big SoC vendors and all the DTBs for the motherboards
> in just those two folders would result in cluttering issues, however it is
> not currently done in arm64/boot/dts, where the subfolders are per-platform
> (exynos, qcom, mtk, tegra, ...) - with an exception of Tesla, which perhaps
> should be also corrected (also CONFIG_ARCH makes it clear what those
> directory names are actually meant to represent).
> 
> If you think the current approach should be changed, it should be changed
> for all device-trees, and the CONFIG_ARCH_* should be also renamed, but also
> we'd need to convince everyone that this approach is superior to others...
> 
> Maybe the solution to this is to have arch/arm64/boot/dts/exynos/google with
> Google's boards, and to have the SoC .dtsi files in
> arch/arm64/boot/dts/exynos, but I'm not sure.

Honesty, I don't care too much about where the files are kept. I agree it makes
sense to keep them with the other Exynos DT files due to similarities with the
other Exynos SoCs. I think the grouping based on vendor under the exynos folder
make a lot of sense though considering how many DT files we will accumulate
over time.

> 
> Additionally, I believe using .dtbo files like that (per board variant) is
> not really expected, instead each board should have its own .dtb file,
> compiled from a board .dts file which includes the SoC .dtsi file but this
> is not up to me to judge...

This is something we (Peter and I) are wanting to discuss at LPC next week.
We've included it in our slides and hope there will be enough folks there to
have a good discussion.

> 
> On 11/4/23 01:05, Maksym Holovach wrote:
> > Hi William,
> > 
> > On 11/3/23 19:36, William McVicker wrote:
> > > Hi Maksym, Krzysztof, Peter,
> > > 
> > > On 11/03/2023, Krzysztof Kozlowski wrote:
> > > > On 03/11/2023 14:56, Maksym Holovach wrote:
> > > > > Hi Peter,
> > > > > 
> > > > > On 11/3/23 15:11, Peter Griffin wrote:
> > > > > > Hi Maksym,
> > > > > > 
> > > > > > Thanks for your feedback.
> > > > > > 
> > > > > > On Thu, 2 Nov 2023 at 22:32, Maksym Holovach
> > > > > > <maksym.holovach.an.2022@lpnu.ua> wrote:
> > > > > > > Hi, all
> > > > > > > 
> > > > > > > I wanted to inquire about how do you all feel about
> > > > > > > calling this SoC by
> > > > > > > the Google "gs101" name.
> > > > > > Interesting question, I think calling it gs101 is the
> > > > > > correct approach see
> > > > > > below for my rationale.
> > > > > > 
> > > > > > > I believe the proper name for it should be the actual Samsung name,
> > > > > > > written in the silicon and reported in the Chip ID
> > > > > > > hardware: Exynos9845.
> > > > > > > This also touches the Tensor G2 (Exynos9855), Tensor
> > > > > > > G3 (Exynos9865),
> > > > > > > and possibly the "Tesla" SoCs.
> > > > > > > 
> > > > > > > I do not think the Linux kernel should be a marketing material: it
> > > > > > > should reflect reality. The chip is almost 100% composed of Samsung
> > > > > > > Exynos IP blocks and should be called that way.
> > > > > > As you alluded to Tesla fsd and Axis artpec8 SoCs are also based on
> > > > > > Exynos designs and support upstream uses the
> > > > > > axis,artpec8* or tesla,fsd*
> > > > > > compatibles.
> > > > > > 
> > > > > > So using google,gs101 is consistent with the existing upstream naming
> > > > > > scheme, for customized ASICs that were based off a Exynos design. But
> > > > > > it also reflects the reality that this SoC is not a
> > > > > > Exynos9845 as there is
> > > > > > also a lot of Google owned and other third party IP
> > > > > > integrated that is not
> > > > > > found in Exynos9845.
> > > > > A quick question: Do you imply Exynos9845 exists outside of
> > > > > the context
> > > > > of Tensor G1? I used to believe Exynos9845 **is** Tensor G1.
> > > Yes, the gs101 SoC is *not* equivalent to the Exynos9845. Similar to
> > > how Tesla
> > > FSD licenses Exynos IP blocks, gs101 does not only comprise of Exynos IP
> > > blocks. The final design is unique to Google and comprises of
> > > several different
> > > vendor IP blocks (not only Exynos).
> > > 
> > > > > Also, what kind of Google IP are you talking about? I believe only the
> > > > > neural accelerator should be custom-ish.
> > > > > 
> > > > > Additionally, I believe it having or not having Google IP is
> > > > > irrelevant:
> > > > > for example, the new Raspberry Pi 5 Broadcom SoC has a lot of
> > > > > Raspberry's own IP, but it's still called Broadcom as it's the real
> > > > > manufacturer and designer of the chip.
> > > > That's a good argument. Indeed BCM2712 contains "New Raspberry
> > > > Pi-developed ISP".
> > > > https://www.raspberrypi.com/documentation/computers/processors.html
> > > > 
> > > > There aren't many patches but GPU is still called brcm,2712.
> > > > 
> > > > For Tesla FSD, there was discussion and output was not very consisting.
> > > > First, the name itself was used for everything - SoC architecture, one
> > > > given SoC and eventually the board.
> > > > https://lore.kernel.org/all/5ab62673-8d46-ec1d-1c80-696421ab69ca@canonical.com/
> > > > 
> > > > 
> > > > Eventually the last part - board - was renamed to "Evaluation board",
> > > > but I don't know how true or real it is.
> > > > 
> > > > See also:
> > > > "I would argue that if this SoC shares the pinctrl, clock, spi, adc,
> > > > and timer implementation
> > > > with Exynos, we should consider it part of the Exynos family,"
> > > > https://lore.kernel.org/all/CAK8P3a31bCHNcNWrLX+QW+4RuK=DBpxLA_j5BFKxXxXKCT8PFQ@mail.gmail.com/
> > > > 
> > > > 
> > > > However it was also claimed:
> > > > 
> > > > "AFA architecture is concerns both Exynos and FSD has completely
> > > > different architecture (at least at HW level)."
> > > > https://lore.kernel.org/all/07ce01d8091e$9a6fd9c0$cf4f8d40$@samsung.com/
> > > > 
> > > > 
> > > > > > I guess the same is also true for `axis,artpec8` and
> > > > > > `tesla,fsd` SoCs.
> > > > > > IMO the SoC compatible string should be uniquely
> > > > > > identifying the actual
> > > > > > SoC, not a close relative.
> > > > > > 
> > > > > > Regarding product_id you are correct this reads 0x09845000 but even
> > > > > > within Samsung Exynos family there are examples where the register
> > > > > > value does not match the SoC compatible. For example Exynos850 SoC
> > > > > > has a product ID value of "E3830". Where the Linux compatible is
> > > > > > matching the Samsung marketing name, not the internal/outdated name.
> > > > > I did not know Exynos 850 is also not going under it's real name.
> > > > > Ultimately, I believe all of those SoCs should go under
> > > > > their technical
> > > > > name in the exynos/ directory.
> > > > The initial technical name does not exist outside of vendor sources and
> > > > part name. E.g. Winlink E850 board hardware manual calls it:
> > > > "Samsung Exynos 850, S5E3830"
> > > > and everywhere else Exynos 850 SoC is used.
> > > > 
> > > > If you start calling it Exynos 3830, only me and Sam (who mainlined it)
> > > > would know what is it. Everyone else, all users of kernel, would be
> > > > confused.
> > > > 
> > > > Therefore using well known final product name is for Exynos850
> > > > reasonable.
> > > I agree with this. By using the final (well known) product SoC name
> > > -- gs101 --
> > > other developers will be able to easily identify the particular SoC.
> > > 
> > > > > Another concern is that Google could in the future license
> > > > > other SoC: be
> > > > > it Qualcomm, Nvidia or anything. If we put completely
> > > > > different hw under
> > > > > google/ directory, does it really make sense? In that case, who'll
> > > > > maintain the google/ directory? Exynos people? Qualcomm people if they
> > > > > license it? Some other people?
> > > I don't understand why the architecture of the SoC would dictate
> > > which folder
> > > to put the device tree files under. It makes more sense to group
> > > board DT files
> > > together based on who distributes them. Having all the Pixel DT
> > > board files
> > > together allows Google to create a single device tree binary per SoC
> > > coupled
> > > with the set of device tree overlays per board variant (this is the
> > > dtbo.img)
> > > to ship to all their devices. If you look at all the in-market Pixel
> > > devices
> > > with Tensor SoCs, you will find that you could create one dtb
> > > (concatenate
> > > gs101.dtb, gs201.dtb, and zuma.dtb) and one dtbo image for 10
> > > devices which
> > > significantly simplifies the maintenance, testing, and software
> > > distribution
> > > for all 10 of those products.
> > 
> > How is that relevant?
> > 
> > I believe it is none of the kernel concerns, it's up to the user to do
> > whatever with the built .dtb files.
> > 
> > Also I do not see an issue in having a file list of all the .dtbo files
> > you might want.

I think organizing the DT files based on a product is relevant because it makes
it easier to identify what files are associated with the final product(s).
Leaving it up to the user just means you are forcing everyone to roll their own
scripts to re-organize/postprocess the kernel artifacts for their products.
I think it would be nice to be able to configure the kernel build to generate
artifacts that are directly usable on the device.

> > > 
> > > > That's indeed a problem. Future Tesla SoC might have just few pieces
> > > > similar to FSD. There would be no common SoC part, except the actual
> > > > Tesla IP.
> > > > 
> > > > Same for Google. Future GSXXX, if done by Qualcomm, will be absolutely
> > > > different than GS101 and the only common part would be the TPU
> > > > (Tensor).
> > > > 
> > > > So now let's decide what is the common denominator:
> > > > 1. Core SoC architecture, like buses, pinctrl, clocks, timers, serial,
> > > > and many IP blocks, which constitute 95% of Devicetree bindings
> > > > and drivers,
> > > > 2. The one, big piece made by Samsung's customer: TPU, NPU or whatever.
> > > As mentioned above, I think this should be based on how the DTBs and
> > > DTBOs are
> > > used and distributed. What is the benefit of adding the gs101 board
> > > files under
> > > the exynos folder?
> > 
> > One clear benefit would be the ease of maintaining all the SoC files at
> > once. It's not that it is a benefit of having it in the Exynos folder,
> > it's more like that there's no benefit in having a separate folder, and
> > that also comes with some additional issues.
> > 
> > As I said earlier, it's pretty similar to the Raspberry Pi 5 example: It
> > contains Raspberry's in-house IP, but it's still called properly
> > Broadcom. The only difference is that Raspberry does not want its name
> > on the chip, but Google does, despite it being just as custom as the
> > Raspberry SoC is. The company's policy should not be a factor for this
> > decision, in my opinion.
> > 
> > However as you've added, gs101 is the same thing as Exynos9845, so I
> > believe there's no question that the Exynos name should be specified
> > somewhere too, because this is what's literally wired in hardware, and
> > not just a "well-known name that is used by Google in the Pixel factory
> > kernel".
> > 
> > I agree though that just specifying the internal E9845 name could
> > mislead some people, but GS101 is a similarly obscure name, and not even
> > the real name of the hardware.

gs101 is used in the downstream drivers as well as referenced in online
materials referring to Pixel 6 (just search for "Google gs101"). In addition,
gs101 is used by the Android userspace to refer to the SoC that Pixel 6/6
Pro/6a use. The same goes for gs201 and zuma.  So I think it's important to
keep the names consistent. I don't think the Exynos 9845 is ever referenced in
the Android vendor userspace nor is it ever used by tech bloggers/writer/
enthusiast developers when referring to the Pixel 6 device. So if upstream
decides to use the term 9845, they will just be introducing even more
confusion.

I also want to point out that I don't really like the Tensor name either. This
is equivalent to the "Snapdragon" marketing name that is not used either in the
Qualcomm device tree. In my opinion, gs101 is equivant to the "msmXYZ" and
"smXYZ" names, e.g. msm8996 and sm8650.

Thanks,
Will

> > 
> > > 
> > > Thanks,
> > > Will
> > > 
> > > > > Then, I don't think Tensor G3 has a proper "GS" name, it
> > > > > goes by "Zuma"
> > > > > in decompiled kernel modules as far as I see.
> > > > > 
> > > > > Finally, Tesla people already tried to submit drivers called by Tesla
> > > > > name, but which basically copied the functionality of the Exynos
> > > > > drivers. We would want to avoid that, ideally.
> > > > > 
> > > > > My opinion is that all the Tesla and Google SoCs should be in the
> > > > > exynos/ directory, not only because they are basically Samsung Exynos,
> > > > > but also because they don't really need a separate directory: neither
> > > > > Google nor Tesla didn't neither manufacture or design those SoCs from
> > > > > scratch. The only reason I can think of for them to have it in a
> > > > > separate directory is maybe because Google and Tesla actually paid
> > > > > Samsung money for the right to call Exynos "Google designed"
> > > > > SoCs, but I
> > > > > believe the kernel should be left out of that.
> > > > For some reason, although I know which, Cc-list is here trimmed and
> > > > misses Alim...
> > > > 
> > > > So standard reply follow (it makes me really, really grumpy, because it
> > > > means you develop on some crazy old kernel or do not use tools which
> > > > automate the process):
> > > > 
> > > > Please use scripts/get_maintainers.pl to get a list of necessary people
> > > > and lists to CC (and consider --no-git-fallback argument). It might
> > > > happen, that command when run on an older kernel, gives you outdated
> > > > entries. Therefore please be sure you base your patches on recent Linux
> > > > kernel.
> > > > 
> > > > Best regards,
> > > > Krzysztof
> > > > 
> > Yours,
> > 
> > Maksym
> > 
> Yours,
> 
> Maksym
> 
