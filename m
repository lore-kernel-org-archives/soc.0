Return-Path: <SRS0=Ssp7=BF=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65C8C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 12:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EF11C433A0; Tue, 16 May 2023 12:29:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 3B072C433D2;
	Tue, 16 May 2023 12:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B072C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544EF2F4;
	Tue, 16 May 2023 05:30:21 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 336033F663;
	Tue, 16 May 2023 05:29:34 -0700 (PDT)
Date: Tue, 16 May 2023 13:29:31 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	soc@kernel.org, wanghuiqiang@huawei.com, tanxiaofei@huawei.com,
	liuyonglong@huawei.com, huangdaode@huawei.com,
	linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] soc: hisilicon: Support HCCS driver on Kunpeng SoC
Message-ID: <20230516122931.il4ai7fyxdo5gsff@bogus>
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <e0c4f4b5-8b34-4542-b676-f98ddb8ef586@app.fastmail.com>
 <20230425103040.znv66k364ant6klq@bogus>
 <c7d9c3c5-e400-c60a-52e0-0f267ec8c517@huawei.com>
 <20230425131918.5tf5vot4h7jf54xk@bogus>
 <db6c713c-f99c-fa3f-8d38-9a5d50889cc2@huawei.com>
 <20230515130807.pdvx7bxwjkfdsmsr@bogus>
 <aa5b1919-74c6-1f97-78af-ab5f0904c3ce@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aa5b1919-74c6-1f97-78af-ab5f0904c3ce@huawei.com>

On Tue, May 16, 2023 at 03:35:54PM +0800, lihuisong (C) wrote:
>
> =E5=9C=A8 2023/5/15 21:08, Sudeep Holla =E5=86=99=E9=81=93:
> > On Thu, May 04, 2023 at 09:16:16PM +0800, lihuisong (C) wrote:
> > > I'm tring to use CRS with GAS to report PCC channel ID and get other
> > > informations driver need by address.
> > OK you had pcc-chan-id pcc-type and device-flags in the DSD style bindi=
ngs
> > to begin with. I haven't understood device-flags here so can't comment =
on
> > that.
>
> We want to use the 'device-flags' to report some information by bit.

Please give more details, until then NACK for the idea.

> Currently, this driver requests PCC channel and use type2 to communicate
> with firmware.

OKAY...

> But, if some platform support type3 and PCC Operation Region, driver can
> choice this method to communicate with firmware.
> So firmware and driver have to use this flag to make compatibility.
>

I would rather add such things to the spec if it is any sort of limitation
with the current specification.

> >
> > > I found a way to obtain the generic register information according to
> > > "Referencing the PCC address space" in ACPI spec.
> > > And driver also get the PCC generic register information successfully.
> > >
> > Can you elaborate ? I assume by that you must be able to get pcc-chan-id
>
> Yes=EF=BC=8Cdriver can get pcc-chan-id by below register.
>
> Register (PCC, RegisterBitWidth, RegisterBitOffset, RegisterAddress, Acce=
ssSize)
>

Good to know.

> > right ? You must not need pcc-type as the pcc mailbox driver must handle
> > the type for you. If not, we may need to fix or add any missing support.
> Yes, PCC driver doesn't support it currently. And aother patch [1] we've
> been talking about does it.
> If it is applied to kernel, we can drop this pcc-type here.
>
> [1] https://patchwork.kernel.org/project/linux-acpi/patch/20230423110335.=
2679-2-lihuisong@huawei.com/

OK then we are good, no need for pcc-type then ?

> >
> > > But I don't know how to set and use the address in PCC register.
> > It must be same as what you would have specified in you new bindings
> > under "pcc-chan-id". I am confused as you say you were able to get the
> > PCC generic register information successfully but you still claim you
> > don't know how to set or use the address.
> My confusion about this address is mentioned below.

OK

> > > Where should this address come from?
> > > It seems that ACPI spec is not very detailed about this.
> > > Do you have any suggestions?
> > >
> > I am afraid, I don't have any as I am failing to understand the exact i=
ssue
> > you are facing.
> >
> > Let me try to ask the question explicity here:
> >
> > If you are just referring to just the <RegisterAddress,> in
> >
> > Register (PCC, RegisterBitWidth, RegisterBitOffset, RegisterAddress, Ac=
cessSize)
> Yeah, this is what I'm using.
> >
> > then,
> >
> > RegisterAddress is usually the offset in the comms address associated w=
ith
> Communication subspace in share memory of PCC subspace?
> > the PCC subspace ID specified in AccessSize. Yes the use of AccessSize =
for
> > the PCC subspace ID is bit confusing though.
> >
> > You can either list all the registers with _CRS individually or the dri=
ver
> List all the registers as following way?
> Name (_CRS, ResourceTemplate ()=C2=A0 // _CRS: Current Resource Settings
> {
> =C2=A0=C2=A0 =C2=A0QWordMemory (ResourceProducer, PosDecode, MinFixed, Ma=
xFixed,
> NonCacheable, ReadWrite,
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 0x0000000000000000, // Granularity
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 0x0000000098190000, // Range Minimum
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 0x000000009819FFFF, // Range Maximum
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 0x0000000000000000, // Translation =
Offset
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 0x0000000000010000, // Length
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 ,, , AddressRangeMemory, TypeStatic)
> })

Not sure if you can use QWordMemory here TBH.

> > can just use the PCC subspace ID in AccessSize and keep RegisterAddress=
 =3D 0
> > but access individual offset based on its own knowledge. I haven't seen=
 the
> Following words come from ACPI spec.
> -->
> As an example, the following resource template refers to the feld occupyi=
ng
> bits 8 through 15 at address 0x30 in PCC
> subspace 9:
> ResourceTemplate()
> {
> Register (
> =C2=A0=C2=A0=C2=A0 PCC, //AddressSpaceKeyword
> =C2=A0=C2=A0=C2=A0 8, //RegisterBitWidth
> =C2=A0=C2=A0=C2=A0 8, //RegisterBitOffset
> =C2=A0=C2=A0=C2=A0=06pcc 0x30, //RegisterAddress
> =C2=A0=C2=A0=C2=A0 9 //AccessSize (subspace ID)
> =C2=A0=C2=A0=C2=A0 )
> }
>
> If the width of the address is 32bit, set RegisterAddress to 0,
> RegisterBitOffset to 0 and set RegisterBitWidth to 64 here.
> Driver can access to the ((void __iomem *)pcc_comm_addr + 0x8 + 0) and
> ((void __iomem *)pcc_comm_addr + 0x8 + 4) address=EF=BC=8Cright?
> (This virtual address =3D pcc mapped address + header size + offset withi=
n PCC
> subspace.)

Yes that's my understanding. I remember seeing the driver is just fetching
pcc-chan-id using DSD style key-value pair, which means you don't need
any other info other than the PCC subspace/channel ID, just have address
as 0.

Also I see the driver uses type for just rejecting the type 3 PCCT. The
question is will the driver probe and run on a platform with type 3 PCCT ?
If so what is the problem running on such a platform. I see it is useless
check in the driver and can be dropped. Also the comment above enum
HCCS_DEV_FLAGS_INTR_B is confusing and  so is the way flags is used.

> > full driver yet but I assuming that's how you would have used if you we=
nt with
> > your DSD pcc-chan-id proposal.
> >
> > > On the other hand, we think that System Memory space + method can also
> > > achieve above goal. What do you think of that?
> > Again I don't understand what you mean by that.
> Sorry, here is what I want to say.
> -->
> OperationRegion (CCS0, SystemMemory, 0x00000002081000CC, 0x04)
> Field (CCS0, DWordAcc, NoLock, Preserve)
> {
> =C2=A0=C2=A0 =C2=A0HAU1,=C2=A0=C2=A0 32
> }
> OperationRegion (CCS1, SystemMemory, 0x0000000201070410, 0x04)
> Field (CCS1, DWordAcc, NoLock, Preserve)
> {
> =C2=A0=C2=A0=C2=A0 HCGE,=C2=A0=C2=A0 32
> }
> Method (_DSM, 2, Serialized)=C2=A0 // _DSM: Device-Specific Method
> {
> =C2=A0=C2=A0 =C2=A0If ((Arg0 =3D=3D ToUUID ("b06b81ab-0134-4a45-9b0c-4834=
47b95fa7")))
> =C2=A0=C2=A0 =C2=A0{
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 If ((Arg1 =3D=3D One))
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Return (HAU1)
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 }
>
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Return (HCGE)
> =C2=A0=C2=A0 =C2=A0}
> }
>
> Driver can call _DSM method to get some information, such as pcc_chan_id =
and
> device_flags.

Big fat NACK for _DSM for the above purpose, please stop abusing _DSM or _D=
SD
for such information which can be obtained with the existing _CRS.

--
Regards,
Sudeep
